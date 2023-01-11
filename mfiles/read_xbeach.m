function [out] = read_xbeach(varargin)
  p = varargin{1};
  if length(varargin) > 1
    out_already = varargin{2};
    out = out_already;
  end
if p.ixbeach==0;out = [];return;end
disp('Reading XBeach results')
maindir = pwd;
%cd .. %return to intermodel/ maindir
addpath(genpath([maindir,'/xbeach']))
outdir = [maindir,'/xbeach/xbeach_sims_fixHs/'];
tmp = strrep(ls([outdir]),'sim','');
numsim = max(max(str2double(split(string(tmp)))));

% For each lidar gauge
for i = 1:numsim
  
  % Read and Save Runup Output
  simdir = [outdir,'/sim',num2str(i)];
  cd(simdir)
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
  %out(i).results = xbo;
  out(i).runup_timeseries = xbo.data(id_runup).value;
  
 

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
  %time_tmp = tplot;outdat(ii)

  runup_tmp = xbo.data(id_runup).value(:,end);
  time_tmp = xbo.data(id_runup).value(:,1);

  % Simple hist method
  NBINS = 20;
  z = runup_tmp;
  t = time_tmp; 
  dt = t(2)-t(1);
  z_mean = nanmean(z);
  z_nomean = z-z_mean;
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
