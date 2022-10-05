function [sed]=sediment(in,i,wavhyd,bathy);
if in.iprofl ==0;sed=0;return;end
phi_crit = 1*.04;
tau_crit = 9810*(in.sg-1)*(in.d50/1000)*phi_crit;% for bed slope = 0 and d50 in mm;
islope = 1;
b1 = 8.5;
runtime = 20;

fac = .5;
c0 = fac*1.5e-3;
c1 = 1.2*fac*1e-1;
c2 = 1.5*fac*1e-3;
bedthick = .02;
sed.bedthick = bedthick;
iadvect = 1;
idiffx = 0;
sed.cf = .003*ones(size(in.x));
sed.eddycoeff = [c0 c1 c2];

a=wavhyd.angle;a(isnan(a)) = 0;
dz = .0004;
nu = 1*1E-6;
dt = .5*dz^2/nu; N = in.Tp/dt;
dt = .01;
numx = length(bathy.x);
numT = ceil(runtime/in.Tp);
t=[0:dt:numT*in.Tp(i)]';numt=length(t);t = repmat(t,1,numx);
phase  = in.dx*cumsum(wavhyd.k)-in.dx*wavhyd.k(1);
iswash = repmat(wavhyd.iswash,numt,1);
zb = repmat(in.zb,numt,1);

% make representative time series including wave orb vel
%Abreu et al.'s (2010): 
% phi = 0;r = 0;
% phi = -pi/4;r = .85;
% nonlinshape = wavhyd.Q.^.01;
% phi = phi*nonlinshape;
% r = r*nonlinshape;
% eta = .5*repmat(wavhyd.Hrms,numt,1).*(sin(-phase+t*2*pi/in.Tp(i))+r.*sin(phi)./(1+sqrt(1-r.^2)))./(1-r.*cos(-phase+t*2*pi/in.Tp(i)+phi));

in2.t = t(:,1);
in2.T = in.Tp;
in2.Hs = sqrt(2)*wavhyd.Hrms;
in2.k  = wavhyd.k;
in2.d = wavhyd.h;
[in2.Ur] = 1*ursell(in2.Hs,in2.k,in2.d);
in2.x=bathy.x;
[out] = nonlin_free_surface_shape (in2);
eta = out.eta_xt;
sed.Ur = in2.Ur;
sed.Sk = out.Sk;

%eta(isnan(eta))=in.zb(isnan(eta));
stdeta = repmat(std(eta),numt,1);
etac = eta.*repmat(1.*wavhyd.Hrms./(sqrt(8)*std(eta)),numt,1); %correction to ensure Hrms = sqrt(8)*std(eta)
eta(stdeta>.01) = etac(stdeta>.01);
h = repmat(wavhyd.h,numt,1)+0*eta;
kh = h.*repmat(wavhyd.k,numt,1);
%h = .05*ones(size(h));
Utilde = (2*pi/in.Tp(i))*eta./sinh(kh);
utilde = Utilde.*cos(repmat(wavhyd.angle,numt,1)*pi/180);
vtilde = Utilde.*sin(repmat(wavhyd.angle,numt,1)*pi/180);
U = 1*wavhyd.U + 1*utilde+.0;
V = 1*wavhyd.V + 1*vtilde;
Umag = sqrt(U.^2+V.^2);

% simple exp profile inside bl
numz = 50;
z = linspace(0,5*bedthick,numz);
z = repmat(reshape(z,1,1,[]),numt,numx);
decay = -log(.02)/bedthick;
u = repmat(U,1,1,numz).*min(1,(1-exp(-decay*z))); 


%U = U.*repmat(ramps(t(:,1),in.Tp(i),0),1,numx);
% z = repmat([0:dz:.05]',1,numx);numz = size(z,1);
% u_defect = zeros(size(z)); % u_defect = U-u;
% v_defect = zeros(size(z)); % u_defect = U-u;
% u = zeros(size(z));v = zeros(size(z));
% u(end,:)=U(1,:);v(end,:)=V(1,:);
% for j = 1:numt; % time index
%   u_defect(1,:)=U(j,:);  
%   u_defect(2:end-1,:) = u_defect(2:end-1,:) +nu*dt/dz^2*...
%       (u_defect(3:end,:)-2*u_defect(2:end-1,:)+u_defect(1:end-2,:));
%   u = repmat(U(j,:),numz,1)-u_defect;
%   v_defect(1,:)=V(j,:);  
%   v_defect(2:end-1,:) = v_defect(2:end-1,:) +nu*dt/dz^2*...
%       (v_defect(3:end,:)-2*v_defect(2:end-1,:)+v_defect(1:end-2,:));
%   v = repmat(V(j,:),numz,1)-v_defect;
%   %  usave(:,:,j) = u;
%   tau_blx(j,:) = 1000*nu*(u(2,:)-u(1,:))/dz;
%   tau_bly(j,:) = 1000*nu*(v(2,:)-v(1,:))/dz;
% end
%inds = find(t(:,1)>-1);
sed.Utilde = Utilde(:,:);
sed.U = U(:,:);
sed.V = V(:,:);
sed.time = t(:,:);
sed.z = z;
sed.u = u;
%sed.tau_bl_x=tau_blx(inds,:);
%sed.tau_bl_y=tau_bly(inds,:);
tau_quad_x=1000*repmat(sed.cf,size(t,1),1).*U.*sqrt(U.^2+V.^2);
tau_quad_y=1000*repmat(sed.cf,size(t,1),1).*V.*sqrt(U.^2+V.^2);
sed.tau_quad_x=1000*repmat(sed.cf,size(sed.time,1),1).*sed.U.*sqrt(sed.U.^2+sed.V.^2);
sed.tau_quad_y=1000*repmat(sed.cf,size(sed.time,1),1).*sed.V.*sqrt(sed.U.^2+sed.V.^2);
%sed.tau_blscaled_x=repmat(std(sed.tau_quad_x)./std(sed.tau_bl_x),size(sed.time,1),1).*sed.tau_bl_x;
%sed.tau_blscaled_y=repmat(std(sed.tau_quad_y)./std(sed.tau_bl_y),size(sed.time,1),1).*sed.tau_bl_y;
%sed.tau_excess = sqrt(sed.tau_blscaled_x.^2+sed.tau_blscaled_y.^2)-tau_crit;sed.tau_excess(sed.tau_excess<0)=0; 
tau_excess = sqrt(tau_quad_x.^2+tau_quad_y.^2)-tau_crit;tau_excess(tau_excess<0)=0; 
sed.tau_excess = sqrt(sed.tau_quad_x.^2+sed.tau_quad_y.^2)-tau_crit;sed.tau_excess(sed.tau_excess<0)=0; 
sed.eta = eta;
sed.h = h;
% find near-bed dissipation
sed.Df=1000*in.cf.*Umag.^3;
detadt=cdiff(1,eta')';
inddiss = (detadt>0);% pulse of diss for mixing on rising free surface
                     %inddiss = (detadt<0);% pulse of diss for mixing on falling free surface
                     %inddiss = (eta<repmat(mean(eta),numt,1));% pulse of diss for mixing on pos free surface positino
Db=wavhyd.Db;
fracpos = sum(inddiss)/size(eta,1);
sed.Db = repmat(Db./fracpos,numt,1).*inddiss;
sed.nus = c0+c1*bedthick*(sed.Df/1000).^(1/3)+c2*h.*(sed.Db/1000).^(1/3);
s  = islope*repmat(cdiff(in.dx,bathy.zb),size(sed.time,1),1);

%bedload equib
Vbe = (b1*tau_excess./(9810*(in.sg-1))).*(tau_excess./tau_crit).^0; %equilibrium bedload concentration
maxVbe=(1-in.sporo)*(in.zb-in.zbhard); % limted by hard bottom
                                       
%sus equib
%Vbe = s1*(tau_excess/1000)/(9.81*(in.sg-1)); %equilibrium bedload concentration


Vb = zeros(numt,numx);
Vs = zeros(numt,numx);
Cs0 = zeros(numt,numx);

Vbe(1,:) = min(Vbe(1,:),maxVbe);
for j = 2:numt; % time index
  dumb = Vb(j-1,:);Udum = U(j,:);
  dums = Vs(j-1,:);Udum = U(j,:);
  dVbdxpos = (dumb-[0 dumb(1:end-1)])/in.dx;
  dVbdxneg = ([dumb(2:end) 0]-dumb)/in.dx;
  udvbdx  = Udum.*(dVbdxpos.*(Udum>0)+dVbdxneg.*(Udum<0));
  udvbdx(isnan(udvbdx))=0;
  dVsdxpos = (dums-[0 dums(1:end-1)])/in.dx;
  dVsdxneg = ([dums(2:end) 0]-dums)/in.dx;
  udvsdx  = Udum.*(dVsdxpos.*(Udum>0)+dVsdxneg.*(Udum<0));
  udvsdx(isnan(udvsdx))=0;
  Fallout(j,:) = 1*Vb(j-1,:)*in.wf/bedthick;
  %Vbe(j,:) = min(Vbe(j,:),maxVbe);
  Vbe(j,:) = min(Vbe(j,:),maxVbe+bedthick/in.wf*Fallout(j,:));
  Pickupb = Vbe(j,:)*in.wf/bedthick;
  %Cs0(j-1,:)= in.wf*Vs(j-1,:)./mean(sed.nus);
  dcdz = 1*(Cs0(j-1,:)-((Vb(j-1,:)./bedthick)))/bedthick;
  dcdx = cdiff(in.dx,Cs0(j-1,:));dcdx(isnan(dcdx))=0;
  Fxdiff = cdiff(in.dx,sed.nus(j-1,:).*dcdx);Fxdiff(isnan(Fxdiff))=0;
  %dcdz(dcdz>0)=0;
  %I(j,:) = -in.wf*Vs(j-1,:)./h(j-1,:)-sed.nus(j-1,:).*dcdz;
  I(j,:) = -in.wf*Cs0(j-1,:)-sed.nus(j-1,:).*dcdz;
  %I(j,:) = -.3*in.wf*Cs0(j-1,:)+.5*Vb(j-1,:)/dt;
  Vb(j,:) = Vb(j-1,:) - iadvect*dt*udvbdx + dt*Pickupb - dt*Fallout(j,:) - dt*I(j,:);
  Vs(j,:) = Vs(j-1,:) - iadvect*dt*udvsdx + dt*I(j,:)  + dt*idiffx*Fxdiff;
  %sm = window(Vs(j,:),3)-Vs(j,:);sm(isnan(sm))=0;
  %Vs(j,:) = Vs(j,:)+sm; % try diffusion
  Cs0(j,:)= in.wf*Vs(j,:)./(5e-5+mean(sed.nus));
end
c = zeros(size(z));
cbed=repmat(Vb,1,1,numz)/bedthick;
csus=repmat(Cs0,1,1,numz).*exp(-in.wf*z./repmat(sed.nus,1,1,numz));
c(z<bedthick)=cbed(z<bedthick);
c(z>=bedthick)=csus(z>=bedthick);


sed.c = c;
sed.Vb = Vb;
sed.Cb = Vb./bedthick;
sed.Vbe = Vbe(:,:);
sed.Fallout = Fallout;

sed.qbx0 = sed.Vb.*utilde;
sed.qby  = sed.Vb.*sed.V;
Gspos = 1 - s./(in.tanphi-abs(s)); % for pos qx
Gsneg = 1 + s./(in.tanphi-abs(s));
sed.qbx = sed.qbx0.*Gspos.*(sed.qbx0>=0) + sed.qbx0.*Gsneg.*(sed.qbx0<0);


%susload
sed.Vs = Vs;
sed.Cs0 = Cs0;
%sed.Vse = (wavhyd.Db*in.effb)./(9810*(in.sg-1)*in.wf);
sed.qsx = sed.Vs.*sed.U;
sed.qsy = sed.Vs.*sed.V;
sed.Vbe = Vbe;

% save ave results for last wave period
inds = find(t(:,1)>(numT-2)*in.Tp(i)&t(:,1)<=(numT-1)*in.Tp(i));

sed.aveqsx=mean(sed.qsx(inds,:));
sed.aveqsy=mean(sed.qsy(inds,:));
sed.aveqbx=mean(sed.qbx(inds,:));
sed.aveqby=mean(sed.qby(inds,:));
sed.stdqsx=std(sed.qsx(inds,:));
sed.stdqsy=std(sed.qsy(inds,:));
sed.stdqbx=std(sed.qbx(inds,:));
sed.stdqby=std(sed.qby(inds,:));
sed.aveqx = sed.aveqbx+sed.aveqsx;
sed.aveqy = sed.aveqby+sed.aveqsy;
sed.aveinds = inds;
%ursll = Hrms.*(2*pi./k)./h.^3;


