function [bathy]=make_bathy(in);

  bathy.x = min(in.x):in.dx:max(in.x);
  bathy.zb = interp1(in.x,in.zb,bathy.x);
  bathy.cf = interp1(in.x,in.cf,bathy.x);
