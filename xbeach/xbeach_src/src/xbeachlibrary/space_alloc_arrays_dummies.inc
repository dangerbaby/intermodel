!  DO NOT EDIT THIS FILE
!  But edit variable.f90 and scripts/generate.py
!  Compiling and running is taken care of by the Makefile




        allocate(s%x                   (0,0))
        allocate(s%y                   (0,0))
        allocate(s%xz                  (0,0))
        allocate(s%yz                  (0,0))
        allocate(s%xu                  (0,0))
        allocate(s%yu                  (0,0))
        allocate(s%xv                  (0,0))
        allocate(s%yv                  (0,0))
        allocate(s%dsu                 (0,0))
        allocate(s%dsv                 (0,0))
        allocate(s%dsz                 (0,0))
        allocate(s%dsc                 (0,0))
        allocate(s%dnu                 (0,0))
        allocate(s%dnv                 (0,0))
        allocate(s%dnz                 (0,0))
        allocate(s%dnc                 (0,0))
        allocate(s%dsdnui              (0,0))
        allocate(s%dsdnvi              (0,0))
        allocate(s%dsdnzi              (0,0))
        allocate(s%alfaz               (0,0))
        allocate(s%alfau               (0,0))
        allocate(s%alfav               (0,0))
        allocate(s%sdist               (0,0))
        allocate(s%ndist               (0,0))
        allocate(s%xyzs01              (0))
        allocate(s%xyzs02              (0))
        allocate(s%xyzs03              (0))
        allocate(s%xyzs04              (0))
        allocate(s%zb                  (0,0))
        allocate(s%zb0                 (0,0))
        allocate(s%theta               (0))
        allocate(s%theta_s             (0))
        allocate(s%thetamean           (0,0))
        allocate(s%Fx                  (0,0))
        allocate(s%Fy                  (0,0))
        allocate(s%Sxy                 (0,0))
        allocate(s%Syy                 (0,0))
        allocate(s%Sxx                 (0,0))
        allocate(s%n                   (0,0))
        allocate(s%H                   (0,0))
        allocate(s%cgx                 (0,0,0))
        allocate(s%cgy                 (0,0,0))
        allocate(s%cx                  (0,0,0))
        allocate(s%cy                  (0,0,0))
        allocate(s%ctheta              (0,0,0))
        allocate(s%ee                  (0,0,0))
        allocate(s%thet                (0,0,0))
        allocate(s%costh               (0,0,0))
        allocate(s%sinth               (0,0,0))
        allocate(s%sigt                (0,0,0))
        allocate(s%rr                  (0,0,0))
        allocate(s%cgx_s               (0,0,0))
        allocate(s%cgy_s               (0,0,0))
        allocate(s%ctheta_s            (0,0,0))
        allocate(s%ee_s                (0,0,0))
        allocate(s%thet_s              (0,0,0))
        allocate(s%costh_s             (0,0,0))
        allocate(s%sinth_s             (0,0,0))
        allocate(s%k                   (0,0))
        allocate(s%c                   (0,0))
        allocate(s%cg                  (0,0))
        allocate(s%sigm                (0,0))
        allocate(s%wm                  (0,0))
        allocate(s%hh                  (0,0))
        allocate(s%zs                  (0,0))
        allocate(s%zs0                 (0,0))
        allocate(s%tideinpt            (0))
        allocate(s%tideinpz            (0,0))
        allocate(s%windinpt            (0))
        allocate(s%windvelts           (0))
        allocate(s%winddirts           (0))
        allocate(s%windxts             (0))
        allocate(s%windyts             (0))
        allocate(s%windsu              (0,0))
        allocate(s%windnv              (0,0))
        allocate(s%dzsdt               (0,0))
        allocate(s%dzsdx               (0,0))
        allocate(s%dzsdy               (0,0))
        allocate(s%dzbdx               (0,0))
        allocate(s%dzbdy               (0,0))
        allocate(s%dzbdt               (0,0))
        allocate(s%dzbnow              (0,0))
        allocate(s%uu                  (0,0))
        allocate(s%vu                  (0,0))
        allocate(s%uv                  (0,0))
        allocate(s%vv                  (0,0))
        allocate(s%qx                  (0,0))
        allocate(s%qy                  (0,0))
        allocate(s%sedero              (0,0))
        allocate(s%dcbdx               (0,0))
        allocate(s%dcbdy               (0,0))
        allocate(s%dcsdx               (0,0))
        allocate(s%dcsdy               (0,0))
        allocate(s%ui                  (0,0))
        allocate(s%vi                  (0,0))
        allocate(s%E                   (0,0))
        allocate(s%R                   (0,0))
        allocate(s%urms                (0,0))
        allocate(s%D                   (0,0))
        allocate(s%Qb                  (0,0))
        allocate(s%ust                 (0,0))
        allocate(s%ueu                 (0,0))
        allocate(s%vev                 (0,0))
        allocate(s%vmagu               (0,0))
        allocate(s%vmageu              (0,0))
        allocate(s%vmagv               (0,0))
        allocate(s%vmagev              (0,0))
        allocate(s%u                   (0,0))
        allocate(s%v                   (0,0))
        allocate(s%ue                  (0,0))
        allocate(s%ve                  (0,0))
        allocate(s%ue_sed              (0,0))
        allocate(s%ve_sed              (0,0))
        allocate(s%hold                (0,0))
        allocate(s%wetu                (0,0))
        allocate(s%wetv                (0,0))
        allocate(s%wetz                (0,0))
        allocate(s%wete                (0,0))
        allocate(s%hu                  (0,0))
        allocate(s%hv                  (0,0))
        allocate(s%hum                 (0,0))
        allocate(s%hvm                 (0,0))
        allocate(s%vmag                (0,0))
        allocate(s%ccg                 (0,0,0))
        allocate(s%uwf                 (0,0))
        allocate(s%vwf                 (0,0))
        allocate(s%ustr                (0,0))
        allocate(s%usd                 (0,0))
        allocate(s%bi                  (0))
        allocate(s%DR                  (0,0))
        allocate(s%umean               (0,0))
        allocate(s%vmean               (0,0))
        allocate(s%ur                  (0,0))
        allocate(s%D15                 (0))
        allocate(s%D50                 (0))
        allocate(s%D90                 (0))
        allocate(s%sedcal              (0))
        allocate(s%ucrcal              (0))
        allocate(s%Tsg                 (0,0,0))
        allocate(s%Susg                (0,0,0))
        allocate(s%Svsg                (0,0,0))
        allocate(s%Subg                (0,0,0))
        allocate(s%Svbg                (0,0,0))
        allocate(s%ceqbg               (0,0,0))
        allocate(s%ceqsg               (0,0,0))
        allocate(s%ua                  (0,0))
        allocate(s%BR                  (0,0))
        allocate(s%kb                  (0,0))
        allocate(s%Tbore               (0,0))
        allocate(s%dzav                (0,0))
        allocate(s%maxzs               (0,0))
        allocate(s%minzs               (0,0))
        allocate(s%L1                  (0,0))
        allocate(s%Sk                  (0,0))
        allocate(s%As                  (0,0))
        allocate(s%gwhead              (0,0))
        allocate(s%gwheadb             (0,0))
        allocate(s%gwlevel             (0,0))
        allocate(s%gwheight            (0,0))
        allocate(s%gwbottom            (0,0))
        allocate(s%gwu                 (0,0))
        allocate(s%gwv                 (0,0))
        allocate(s%gwqx                (0,0))
        allocate(s%gwqy                (0,0))
        allocate(s%gww                 (0,0))
        allocate(s%gwcurv              (0,0))
        allocate(s%dinfil              (0,0))
        allocate(s%infil               (0,0))
        allocate(s%gw0back             (0,0))
        allocate(s%Kx                  (0,0))
        allocate(s%Ky                  (0,0))
        allocate(s%Kz                  (0,0))
        allocate(s%Kzinf               (0,0))
        allocate(s%kturb               (0,0))
        allocate(s%ero                 (0,0,0))
        allocate(s%depo_im             (0,0,0))
        allocate(s%depo_ex             (0,0,0))
        allocate(s%nd                  (0,0))
        allocate(s%pbbed               (0,0,0,0))
        allocate(s%dzbed               (0,0,0))
        allocate(s%z0bed               (0,0))
        allocate(s%ureps               (0,0))
        allocate(s%vreps               (0,0))
        allocate(s%urepb               (0,0))
        allocate(s%vrepb               (0,0))
        allocate(s%umwci               (0,0))
        allocate(s%vmwci               (0,0))
        allocate(s%rolthick            (0,0))
        allocate(s%zswci               (0,0))
        allocate(s%pres                (0,0))
        allocate(s%dU                  (0,0))
        allocate(s%dV                  (0,0))
        allocate(s%wb                  (0,0))
        allocate(s%ws                  (0,0))
        allocate(s%wscrit              (0,0))
        allocate(s%bedfriccoef         (0,0))
        allocate(s%taubx               (0,0))
        allocate(s%tauby               (0,0))
        allocate(s%Df                  (0,0))
        allocate(s%Dp                  (0,0))
        allocate(s%Sutot               (0,0))
        allocate(s%Svtot               (0,0))
        allocate(s%cctot               (0,0))
        allocate(s%wi                  (0,0))
        allocate(s%dUi                 (0,0))
        allocate(s%zi                  (0,0))
        allocate(s%nuh                 (0,0))
        allocate(s%cf                  (0,0))
        allocate(s%cfu                 (0,0))
        allocate(s%cfv                 (0,0))
        allocate(s%D50top              (0,0))
        allocate(s%D90top              (0,0))
        allocate(s%structdepth         (0,0))
        allocate(s%zs0fac              (0,0,0))
        allocate(s%tdisch              (0))
        allocate(s%pdisch              (0,0))
        allocate(s%pntdisch            (0))
        allocate(s%qdisch              (0,0))
        allocate(s%idrift              (0))
        allocate(s%jdrift              (0))
        allocate(s%tdriftb             (0))
        allocate(s%tdrifte             (0))
        allocate(s%runup               (0))
        allocate(s%Hrunup              (0))
        allocate(s%xHrunup             (0))
        allocate(s%istruct             (0))
        allocate(s%iwl                 (0))
        allocate(s%strucslope          (0))
        allocate(s%Dc                  (0,0))
        allocate(s%ph                  (0,0))
        allocate(s%dobs                (0,0))
        allocate(s%sig2prior           (0,0))
        allocate(s%zbobs               (0,0))
        allocate(s%shobs               (0,0))
        allocate(s%bwalpha             (0,0))
        allocate(s%dcmdo               (0,0))
        allocate(s%dassim              (0,0))
        allocate(s%cobs                (0,0))
        allocate(s%shipxCG             (0))
        allocate(s%shipyCG             (0))
        allocate(s%shipzCG             (0))
        allocate(s%shipFx              (0))
        allocate(s%shipFy              (0))
        allocate(s%shipFz              (0))
        allocate(s%shipMx              (0))
        allocate(s%shipMy              (0))
        allocate(s%shipMz              (0))
        allocate(s%shipphi             (0))
        allocate(s%shipchi             (0))
        allocate(s%shippsi             (0))
        allocate(s%vegtype             (0,0))
        allocate(s%nsecveg             (0,0))
        allocate(s%Cdveg               (0,0,0))
        allocate(s%ahveg               (0,0,0))
        allocate(s%bveg                (0,0,0))
        allocate(s%Nveg                (0,0,0))
        allocate(s%Dveg                (0,0))
        allocate(s%Fvegu               (0,0))
        allocate(s%Fvegv               (0,0))
        allocate(s%ududx               (0,0))
        allocate(s%vdvdy               (0,0))
        allocate(s%udvdx               (0,0))
        allocate(s%vdudy               (0,0))
        allocate(s%viscu               (0,0))
        allocate(s%viscv               (0,0))
        allocate(s%setbathy            (0,0,0))
        allocate(s%tsetbathy           (0))
        allocate(s%breaking            (0,0))
        allocate(s%fw                  (0,0))
        allocate(s%sigz                (0))
        allocate(s%uz                  (0,0,0))
        allocate(s%vz                  (0,0,0))
        allocate(s%ustz                (0,0,0))
        allocate(s%nutz                (0,0,0))
        allocate(s%dzs0dn              (0,0))
        allocate(s%ccz                 (0,0,0))
        allocate(s%refA                (0,0))
        allocate(s%ca                  (0,0))
        allocate(s%zs1                 (0,0))
        allocate(s%taubx_add           (0,0))
        allocate(s%tauby_add           (0,0))
        allocate(s%hhw                 (0,0))
        allocate(s%hhws                (0,0))
        allocate(s%uws                 (0,0))
        allocate(s%vws                 (0,0))
        allocate(s%hhwcins             (0,0))
        allocate(s%uwcins              (0,0))
        allocate(s%vwcins              (0,0))
        allocate(s%ucan                (0,0))
        allocate(s%vcan                (0,0))

!directions for vi vim: filetype=fortran : syntax=fortran
