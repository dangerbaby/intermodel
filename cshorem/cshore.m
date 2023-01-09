function [out]=cshore(in)
in=set_defaults(in);
check_in(in);

for k = 1:length(in) % loop over in
  bathy=make_bathy(in(k));
  disp(['running date ',datestr(in(k).date)])
  for i = 1:length(in(k).Hrms)%loop over timesteps in the bc

    % energy and mom balance 
    wavhyd = crossshorewaves(in(k),i,bathy);
    % longshore currents
    [wavhyd] = longshore(in(k),i,wavhyd);
    % cross-shore currents
    [wavhyd.U] = undertow_linear(wavhyd.h,wavhyd.Hrms,in(k).Tp(i));
    % get sed fluxes
    [sed]=sediment(in(k),i,wavhyd,bathy);
    % update bottom position
    [zbnew]=morpho(in(k),sed,bathy.zb);
    
    out(k).zb(i,:)      = bathy.zb;
    out(k).xsws(i)      = wavhyd.xsws;
    out(k).hsws(i)      = wavhyd.hsws;
    out(k).runup_2p(i)  = wavhyd.runup_2p;  
    out(k).runup_2p_x(i)= wavhyd.runup_2p_x;  
    out(k).Hrms(i,:)    = wavhyd.Hrms;
    out(k).Hm(i,:)      = wavhyd.Hm;
    out(k).Q(i,:)       = wavhyd.Q;
    out(k).Ef(i,:)      = wavhyd.Ef;
    out(k).Efr(i,:)     = wavhyd.Efr;
    out(k).Er(i,:)      = wavhyd.Er;
    out(k).eta(i,:)     = wavhyd.eta;
    out(k).h(i,:)       = wavhyd.h;
    out(k).Db(i,:)      = wavhyd.Db;
    out(k).Dr(i,:)      = wavhyd.Dr;
    out(k).Sxx(i,:)     = wavhyd.Sxx;
    out(k).Sxy(i,:)     = wavhyd.Sxy;
    out(k).angle(i,:)   = wavhyd.angle;
    out(k).c(i,:)       = wavhyd.c;
    out(k).iswash(i,:)  = wavhyd.iswash;
    out(k).V(i,:)       = wavhyd.V;
    out(k).U(i,:)       = wavhyd.U;
    %out(k).qx(i,:)      = sed.aveqx;
    %out(k).qbx0(i,:)    = sed.qbx0;
    out(k).sed(i)       = sed;
    out(k).A0           =in(k).A0;

    % update bathy
    bathy.zb = zbnew;
    
    
  end  
  out(k).x  = bathy.x;
  out(k).in = in(k);
end