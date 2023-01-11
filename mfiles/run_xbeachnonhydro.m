function [out] = run_xbeachnonhydro(g,in2)
if g.ixbeachnonhydro==0;out = [];return;end
disp('Running XBeach-NH')
maindir = pwd;
cd(maindir)
addpath(genpath([maindir,'/xbeach']))
%exec_cmd = [maindir,'/xbeach/xbeach_src/src/xbeach/xbeach'];
exec_cmd = [maindir,'/xbeach/xbeachlnk'];
outdir = [maindir,'/xbeach/xbeach_sims_NH_fixHs/'];
mkdir(outdir)
nonhydrostatic = 1;
frf_dir_offset = 72; 
  

% For each lidar gauge
SLR = 0;
for i = 1:length(in2)
  
  % make temp ith working dir
  cd(outdir)
  simdir = ['./sim',num2str(i)]; 
  mkdir(simdir)
  cd(simdir)
 
  % define parameters
  dt_target = (1/24)*86400;
  tstart = 0;
  BC.ts_datenum = tstart*[1:1+1/24];
  BC.Hs = sqrt(2).*ones(numel(BC.ts_datenum)+1,1)*in2(i).Hrms;
  BC.Tp = ones(numel(BC.ts_datenum)+1,1)*in2(i).Tp;
  BC.WL = ones(size(BC.ts_datenum)).*in2(i).swlbc; % water level at seaward boundary in meters
  %tmp_angle = wrapTo360(frf_dir_offset-in2(i).angle); % requires mapping toolbox
  tmp_angle = wrapdeg(frf_dir_offset - in2(i).angle);
  BC.angle = tmp_angle; % constant incident wave angle at seaward boundary in
  
  % Create tide forcing file
  clear tide_data
  tide_data(:,1) = [BC.ts_datenum 99999999];
  tide_data(:,1) = round([(tide_data(:,1) -tide_data(1,1))*86400]);
  tide_data(:,2) = [BC.WL(:)+SLR; BC.WL(end)+SLR];
  tide_data(:,3) = [BC.WL(:)+SLR; BC.WL(end)+SLR];
  save('tide.txt', 'tide_data', '-ascii')

  % Creat wave forcing file
  clear jonswap_data
  nsteps = 2;
  for ix = 1:numel(BC.Hs)
    jonswap_data(ix,:) = [BC.Hs(ix) BC.Tp(ix) round(180+BC.angle) 3.3 20 round(median(dt_target)*nsteps) 1];
  end
  iddel = find(jonswap_data(:,1) == 0);
  jonswap_data(iddel,:) = [];
  jonswap_data(end+1,:) = jonswap_data(end,:);
  
  % Create bathy files
  XNEW = in2(i).x;
  ZNEW = in2(i).zb;
  YNEW = zeros(size(XNEW));
  save('bed.dep' ,'ZNEW', '-ascii')
  save('x.grd' ,'XNEW', '-ascii')
  save('y.grd' ,'YNEW', '-ascii')
  
  % make the infiles
  in = xb_generate_model('bathy', {'x', XNEW, 'y', YNEW, 'z', ZNEW, 'optimize', false});
  in = xs_set(in, 'bedfriction', 'manning');
  in = xs_set(in, 'bedfriccoef', in2(i).fric_fac);
  in = xs_set(in, 'gamma', in2(i).gamma);
  in = xs_set(in, 'hmin', 0.05); % min water depth for flow return
  in = xs_set(in, 'vegetation', 0);
  if nonhydrostatic == 1
  in = xs_set(in, 'nonh', 1); %change this flag if want the nonhydrostatic correction
  in = xs_set(in, 'wavemodel','nonh');
  in = xs_set(in,'nonhspectrum+',1);
  in = xs_set(in,'nmax',1.0);
  %in = xs_set(in,'wbctype','ts_nonh');
  in = xs_set(in,'swrunup','1');
  end
  %in = xs_set(in, 'posdwn', -1);
  in = xs_set(in, 'sedtrans', 0);
  in = xs_set(in, 'morphology', 0);
  in = xs_set(in, 'thetamin', round(180+BC.angle-45));
  in = xs_set(in, 'thetamax', round(180+BC.angle+45));
  in = xs_set(in, 'dtheta', 10);
  in = xs_set(in, 'zs0', 0);
  in = xs_set(in, 'thetanaut', 1);
  in = xs_set(in, 'tstop', 2700);           % 45 minute simulation total, with 30 useable minutes
  in = xs_set(in, 'tstart', 900);           % 15 minute spinup
  in = xs_set(in, 'tideloc', 1);
  in = xs_set(in, 'zs0file', 'tide.txt');
  in = xs_set(in, 'tintp', 1);        
  in = xs_set(in, 'tintm', 900);
  in = xs_set(in, 'tintg', 1);            % global output timestep
  in = xs_set(in, 'rugdepth', 0.01);
  in = xs_set(in, 'nrugauge',{'-500 0'});
  in = xs_set(in, 'globalvar', {'zs', 'zb', 'H'});
  xb_write_input('params.txt', in)
  save('jonswap.txt', 'jonswap_data', '-ascii')
  if nonhydrostatic
    %copyfile nh_series00001.bcf boun_u.bcf
  end

  % run model
  system(exec_cmd);

  % save data in structure (also done in read_xbeachnonhydro, in case this fails somewhere)
  xbo = xb_read_output;
  for jj = 1:length(xbo.data)
    if contains(xbo.data(jj).name,'zs')
      id_zs = jj;
    elseif contains(xbo.data(jj).name,'rug')
        id_runup = jj;
    elseif contains(xbo.data(jj).name,'zb')
      id_zb = jj;
    elseif contains(xbo.data(jj).name,'DIMS')
      for ii = 1:length(xbo.data(jj).value.data)
	if contains(xbo.data(jj).value.data(ii).name,'globalx')
	  xplot = xbo.data(jj).value.data(ii).value;
	elseif contains(xbo.data(jj).value.data(ii).name,'globaltime')
	  tplot = xbo.data(jj).value.data(ii).value;
        end
      end
    end
  end
  out(i).results = xbo;

  % calculate runup time series
  MINDEP = 0.01;                       % water depth of runup line
  bedz = squeeze(xbo.data(id_zb).value(1,1,:));
  zs = squeeze(xbo.data(id_zs).value);
  depthmat = zs - bedz';
  depthmat(depthmat == 0.0) = nan;
  depnorm = depthmat - MINDEP;
  runup_x = nan(1,length(tplot));
  runup_z = nan(1,length(tplot));
  for ii = 1:length(tplot)
    tmptmp = depnorm(ii,1:end-1).*depnorm(ii,2:end);
    idcross = max(find(tmptmp < 0));
    if ~isempty(idcross)
    yplot = interp1([depthmat(ii,idcross),depthmat(ii,idcross+1)],[xplot(idcross),xplot(idcross+1)],MINDEP);
    runup_x(ii) = yplot;
    runup_z(ii) = interp1(xplot,zs(ii,:),yplot);
    end
  end
  dat = xbo.data(id_runup).value;
  xbrunup = dat;
  save xbrunup.mat xbrunup 

  
  % calculate R2%
  %runup_tmp = runup_z;
  %time_tmp = tplot;

  runup_tmp = xbo.data(id_runup).value(:,end);
  time_tmp = xbo.data(id_runup).value(:,1);

  
  % Simple hist method
  NBINS = 20;
  z = runup_tmp;
  t = time_tmp; 
  dt = t(2)-t(1);
  z_mean = nanmean(z);
  z_nomean = z - z_mean;
  idnn = ~isnan(z_nomean); % find elements not nan
  tshort = t(idnn);
  z_nomeanshort = z_nomean(idnn);
  z_nomean = interp1(tshort,z_nomeanshort,t);
  [runup_crests] = upcross_runup(z_nomean); % does not include mean yet
  R_peaks = runup_crests + z_mean; % add mean back
  [N,edges]=histcounts(R_peaks,NBINS); 
  centers = .5*(edges(2:end)+edges(1:end-1));
  dR = edges(2)-edges(1);
  N_norm = N/(sum(N)*dR);
  cdf = cumsum(N_norm*dR);
  thresh = 1 - .02;  % for 2% runup
  crsspt = find((cdf(2:end)-thresh).*(cdf(1:end-1)-thresh)<=0);
  crsspt = crsspt(1);
  r2p = interp1(cdf(crsspt:crsspt+1),centers(crsspt:crsspt+1),thresh);
  out(i).runup_2p = r2p;  


  
  % return to maindir
  cd(maindir)

  
end
end




