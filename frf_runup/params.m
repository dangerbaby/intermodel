function [in,dat] = params(g)

% In an attempt to account for nearshore bottom profile changes, this is
% a series of runs, each with hour duration, where the bathy is reset with data
% rather than a long time-series.  
load ([g.name,'/data/summary_bathy.mat'])
load ([g.name,'/data/summary_waves_bc.mat'])
load ([g.name,'/data/summary_wl.mat'])
load ([g.name,'/data/summary_lidar_science_small.mat'])
%

%lidar_inds = 1:2:20;
lidar_inds = 1:10:length(lidar_sm);
i = 0;
for j = lidar_inds
  i = i+1;
  in(i).dx     = 1;          % constant dx 
  in(i).gamma  = .7;         % shallow water ratio of wave height to water depth
  in(i).fric_fac = .015;     % bottom friction factor
  in(i).lidar_ind = j;

  bnd_gage_num = 1;
  date_bc = lidar_sm(j).date;
  in(i).date = date_bc;
  in(i).Tm = interp1(wave(bnd_gage_num).time,wave(bnd_gage_num).Tm,date_bc);
  in(i).Tp = in(i).Tm;
  %in(i).Tp = interp1(wave(bnd_gage_num).time,1./wave(bnd_gage_num).Fp,date_bc);
  in(i).Hrms  = interp1(wave(bnd_gage_num).time,wave(bnd_gage_num).Hs./sqrt(2),date_bc);
  in(i).angle = interp1(wave(bnd_gage_num).time,wave(bnd_gage_num).Dm_wrtfrf,date_bc);
  in(i).swlbc = interp1(wl.date,wl.wl,date_bc);
  x_offset =  wave(bnd_gage_num).frf_x;
  x_frf = x_offset:-in(i).dx:40;
  x = x_offset-x_frf;
  zb = interp1(lidar_sm(j).frf_xi,lidar_sm(j).zb_full_bar_track,x_frf);
  in(i).x = x;
  in(i).zb = zb;
  in(i).fw = in(i).fric_fac*ones(size(in(i).zb)); % cross-shore values of bot fric

  dat(i).date = lidar_sm(j).date;
  dat(i).r2p  = lidar_sm(j).r2p;
end

