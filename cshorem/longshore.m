function [wavehyd]=longshore(in,i,wavehyd);
V=zeros(size(wavehyd.Hrms));tau_y = V;mix =V;Vnew=V;tau_ym=V;tau_yp=V;U=V;
if in.iroll==1;
  ddxSxy=-sin(wavehyd.angle*pi/180).*wavehyd.Dr./wavehyd.c;
else;ddxSxy = cdiff(in.dx,wavehyd.Sxy);end
ddxSxy(isnan(ddxSxy))=0;

if isfield(in,'detady');prss = 9810*in.detady(i)*wavehyd.h;else; prss=0;end
if isfield(in,'tauwy');tauwy = in.tauwy(i);else; tauwy=0;end
dV = .05;
V_possible = [-5:dV:5]';

for j = find(wavehyd.iswash==0);
  [tau_x tau_ypossible(:,j)] = shear_stress(in.cf(j),wavehyd.Hrms(j),wavehyd.h(j),wavehyd.angle(j),in.Tp(i),0,V_possible);
end
forcing = -ddxSxy-prss+mix+tauwy;

for j=find(wavehyd.iswash==0)
  V(j) = interp1(tau_ypossible(:,j),V_possible,forcing(j));
end
if isfield(in,'nut')&in.nut>0;
  %relax = .99;
  %newV=V;
  resid  = 1;
  relax = 1-exp(-5-3/1500*max(h)*in.nut/in.cf(1));
  cnt = 0;
  %for j = 1:10
  while nanmax(abs(resid)) >.01&cnt<1000
    cnt = cnt+1;
    mixm = cdiff(in.dx,in.nut*1000*h.*cdiff(in.dx,V+dV));
    mix = cdiff(in.dx,in.nut*1000*h.*cdiff(in.dx,V));
    mixp = cdiff(in.dx,in.nut*1000*h.*cdiff(in.dx,V-dV));
    mixm(max(find(iswash==0))-1:end)=0;
    mix(max(find(iswash==0))-1:end) =0;
    mixp(max(find(iswash==0))-1:end)=0;
    mixm(1)=0;
    mix(1)=0;        
    mixp(1)=0;
    for j=find(iswash==0)
      [tau_x dumtau_y] = shear_stress(in.cf(j),Hrms(j),h(j),a(j),Tp,0,[V(j)-dV V(j) V(j)+dV]');
      tau_ym(j) = dumtau_y(1);
      tau_y(j)  = dumtau_y(2);
      tau_yp(j)  = dumtau_y(3);
      dtaudv(j) = (dumtau_y(3)-dumtau_y(1))/(2*dV);
    end
    residm = -ddxSxy-prss+mixm+tauwy-tau_ym;
    resid  = -ddxSxy-prss+mix +tauwy-tau_y;
    residp = -ddxSxy-prss+mixp+tauwy-tau_yp;
    for j=find(iswash==0)
      Vnew(j) = interp1([residm(j)+100 residm(j) resid(j) residp(j) residp(j)-100],[V(j)-dV V(j)-dV V(j) V(j)+dV V(j)+dV],0,'linear'); 
    end
    r = relax;
    V = r*V + (1-r)*Vnew;
    if mod(cnt,10)==0|cnt==1;
      [j1 j2]=max(abs(resid));
      [j3 j4]=max(abs(-ddxSxy-prss+mix +tauwy));
      disp(['Iterations: ',num2str(cnt),', Real points: ',num2str(sum(~isnan(V))),...
            ', Max Residual = ', num2str(j1),' at node ',num2str(j2), ...
            ', Max Forcing = ', num2str(j3),' at node ',num2str(j4), ...
            ', Mean Abs Residual = ', num2str(mean(abs(resid)))                   ]);
    end
  end
  if 1;disp(['Iterations: ',num2str(cnt),', Real points: ',num2str(sum(~isnan(V))),...
             ', Max Residual = ', num2str(max(abs(resid))), ...
             ', Mean Abs Residual = ', num2str(mean(abs(resid)))                   ]);end
end

wavehyd.V = V;