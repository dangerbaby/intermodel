function [wavhyd]=crossshorewaves(in,i,bathy);
    dzbdx = cdiff(in.dx,bathy.zb);  
    [xsws] = interp_brad(bathy.x,in.swlbc(i)-bathy.zb);
    if isnan(xsws);xsws=max(in.x);end
    % initialize  
    Hrms = nan(size(bathy.x));Sxx=Hrms;Sxy=Hrms;a=Hrms;Db=Hrms;
    Hm=Hrms;Efr=Hrms;Dr=Hrms;c=Hrms;Er=Hrms;tau_y=Hrms;dtaudv=Hrms;Q=Hrms;k = Hrms;
    eta = max(in.swlbc(i),bathy.zb);    h=eta-bathy.zb;
    [k(1),n(1),c(1)] = dispersion (2*pi/in.Tp(i),h(1));
    %set conditions at offshore boundary
    Hrms(1) = in.Hrms(i);

    Hm(1) = 0.88./k(1).*tanh(in.gamma*k(1).*h(1)/.88);
    Q(1)=probbreaking(Hrms(1),Hm(1));
    Db(1) = dissipation_bore (in.Tp(i),Q(1),Hm(1));
    E(1) = 1/8*9810*Hrms(1)^2;
    Ef(1) = E(1)*c(1)*n(1);
    a(1) = in.angle(i);
    [Sxy(1) Sxx(1) Syy(1)] = radstress (Hrms(1), a(1), n(1), c(1));
    M(1) = in.A0*9.81*h(1)^2;
    Efr(1) = 0;
    Er(1) = Efr(1)/(2*c(1)*cos(a(1)*pi/180));
    Dr(1) = 2*9.81*Er(1)*sin(in.rollerbeta*pi/180)/c(1);
    iswash(1)=0;
    %step through transect from offshore to swash
    for j = 2:length(bathy.x)
      if(bathy.x(j)<=xsws) % in the surf zone
                    %if(h(j-1)>.28)
        
        %predictor step
        hj = eta(j-1)-bathy.zb(j);
        [k(j),n(j),c(j)] = dispersion (2*pi/in.Tp(i),hj);
        a(j) = snells(a(1),h(1),in.Tp(i),hj);
        Ef(j) = Ef(j-1)-in.dx*Db(j-1);
        E(j)= max(Ef(j)/(c(j)*n(j)),0);
        Hrms(j) = sqrt(8/9810*E(j));
        [Sxy(j) Sxx(j) Syy(j)] = radstress (Hrms(j), a(j), n(j), c(j));
        %roller
        Efr(j) = Efr(j-1)+in.dx*in.iroll*(Db(j-1)-Dr(j-1));
        Er(j) = Efr(j)/(2*c(j)*cos(a(j)*pi/180));
        Dr(j) = 2*9.81*Er(j)*sin(in.rollerbeta)/c(1);
        Sxy(j)= Sxy(j)+2*Er(j)*cos(a(j)*pi/180)*sin(a(j)*pi/180);
        eta(j) = eta(j-1) - 2/(9810*(h(j-1)+hj)) * (Sxx(j)-Sxx(j-1))/in.dx;
        h(j) = max(eta(j)-bathy.zb(j),0);
        
        %corrector
        for iter = 1:3
          hj = h(j);
          %if in.x(j)==20;disp(['iter h(j) eta) ',num2str(iter),'  ',num2str(h(j)),'  ',num2str(eta(j))]);end
          [k(j),n(j),c(j)] = dispersion (2*pi/in.Tp(i),hj);
          a(j) = snells(a(1),h(1),in.Tp(i),hj);
          Hm(j) = 0.88./k(j).*tanh(in.gamma*k(j).*h(j)/.88);
          Q(j) = probbreaking(Hrms(j),Hm(j));
          Db(j) = dissipation_bore (in.Tp(i),Q(j),Hm(j));
          Ef(j) = Ef(j-1)-in.dx*.5*(Db(j-1)+Db(j));
          E(j)= max(Ef(j)/(c(j)*n(j)),0);
          Hrms(j) = min(Hm(j),sqrt(8/9810*E(j)));
          E(j) = 1/8*9810*Hrms(j)^2; % in case Hm is involked
          Ef(j) = E(j)*c(j)*n(j);
          Q(j)=probbreaking(Hrms(j),Hm(j));
          %if j==218;Q(j),[(Q(j)-1)/log(Q(j)) (Hrms(j)/Hm(j))^2],end
          %roller
          Efr(j) = Efr(j-1)+in.dx*in.iroll*.5*(Db(j-1)+Db(j)-Dr(j)-Dr(j-1));
          Er(j) = Efr(j)/(2*c(j)*cos(a(j)*pi/180));
          Dr(j) = 2*9.81*Er(j)*sin(in.rollerbeta)/c(1);
          [Sxy(j) Sxx(j) Syy(j)] = radstress (Hrms(j), a(j), n(j), c(j)); % linear representation
                                                                          %Sxx(j)= Sxx(j)+Mr(j)*cos(a(j)*pi/180)^2;
          Sxy(j)= Sxy(j)+2*Er(j)*cos(a(j)*pi/180)*sin(a(j)*pi/180);
          
          eta(j) = max(eta(j-1) - 2/(9810*(h(j-1)+hj)) * (Sxx(j)-Sxx(j-1)),bathy.zb(j));
          %eta(j) = max(eta(j-1) - 1/(9810*(h(j-1))) * (Sxx(j)-Sxx(j-1))/in.dx,zb(j));
          h(j) = eta(j)-bathy.zb(j);
        end
        %M(j) = in.A0*9.81*h(j)^2;
        M(j) = in.A0*9.81*(Hrms(j)/in.gamma)^2;
        iswash(j)=0;
      else
        % h(j) = h(j-1);
        % for iter = 1:5;
        %   hdum = .5*(h(j-1)+h(j));
        %   M(j) = max(M(j-1)-in.dx*hdum*9.81*dzbdx(j)-1*in.dx*in.cf(j)*9.81*hdum,0);
        %   %disp(['iter h(j) M(j) ',num2str(iter),'  ',num2str(h(j)),'  ',num2str(M(j))])
        %   h(j) = sqrt(M(j)/(in.A0*9.81));
        % end
        h(j) = max(h(j-1)-(in.cf(j)+dzbdx(j))*in.dx/(2*in.A0),0);
        Hrms(j) = in.gamma*h(j);
        M(j) = in.A0*9.81*(Hrms(j)/in.gamma)^2;
        eta(j) = bathy.zb(j)+h(j);
        Ef(j) = NaN;
        [k(j),n(j),c(j)] = dispersion (2*pi/in.Tp(i),h(j));
        if h(j)>eps;iswash(j) = 1;else iswash(j)=NaN;end
      end
    end

    % some logical stuff
    Q(iswash==1) = 1;
    Db(isnan(Db)) = 0;
    a(iswash==1) = a(max(find(iswash==0)));
    
    
    %find runup values
    z_rw = bathy.zb+in.rwh;
    sig_eta = Hrms/sqrt(8);

    x1 = interp_brad(bathy.x,eta+sig_eta-z_rw);
    z1 = interp1(bathy.x,eta+sig_eta,x1);
    x2 = interp_brad(bathy.x,eta-z_rw);
    z2 = interp1(bathy.x,eta,x2);
    x3 = interp_brad (bathy.x,eta-sig_eta-z_rw);
    z3 = interp1(bathy.x,eta-sig_eta,x3);
    
    dzbdxdum = 0;
    wavhyd.runup_mean  = (z1+z2+z3)/3;
    wavhyd.runup_std   = (z1-z3)/2;
    wavhyd.runup_13    = wavhyd.runup_mean +(2+0*dzbdxdum)*wavhyd.runup_std;
    wavhyd.runup_2p    = wavhyd.runup_mean + 1.4*(wavhyd.runup_13-wavhyd.runup_mean);
    wavhyd.runup_mean_x= interp_brad(bathy.x,wavhyd.runup_mean-bathy.zb);
    wavhyd.runup_2p_x  = interp_brad(bathy.x,wavhyd.runup_2p-bathy.zb);
    wavhyd.h           = h;
    wavhyd.xsws        = xsws;
    wavhyd.hsws        = interp1(bathy.x,h,xsws);
    wavhyd.Hrms        = Hrms;
    wavhyd.Hm          = Hm;
    wavhyd.Q           = Q;
    wavhyd.Ef          = Ef;
    wavhyd.Efr         = Efr;
    wavhyd.Er          = Er;
    wavhyd.eta         = eta;
    wavhyd.h           = h;
    wavhyd.Db          = Db;
    wavhyd.Dr          = Dr;
    wavhyd.Sxx         = Sxx;
    wavhyd.Sxy         = Sxy;
    wavhyd.angle       = a;
    wavhyd.c           = c;
    wavhyd.k           = k;
    wavhyd.iswash      = iswash;


    