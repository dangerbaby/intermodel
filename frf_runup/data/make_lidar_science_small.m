if ~exist('lidar')
  load  /home/johnson/data/frf/bathyduck/summary_lidar_science.mat
end

for i = 1:length(lidar)
  lidar_sm(i).r2p               = lidar(i).r2p;
  lidar_sm(i).r2p_brodie        = lidar(i).r2p;
  lidar_sm(i).date              = lidar(i).date;
  lidar_sm(i).frf_xi            = lidar(i).frf_xi;
  lidar_sm(i).zb_full           = lidar(i).zb_full;
  lidar_sm(i).zb_full_bar_track = lidar(i).zb_full_bar_track;
  lidar_sm(i).wg_Hs_in          = lidar(i).wg_Hs_in;
  lidar_sm(i).wg_Hs_ig          = lidar(i).wg_Hs_ig;
  lidar_sm(i).wg_Hs             = lidar(i).wg_Hs;
  lidar_sm(i).wg_reliability    = lidar(i).wg_reliability
  lidar_sm(i).wg_x              = lidar(i).wg_x;
end

save summary_lidar_science_small lidar_sm

