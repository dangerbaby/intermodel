iprint = 1;
fs = 24;

if ~isempty(out_csm);plot_results_csm;end





return
figure(1);clf
plot(out(ind).x,out(ind).Hrms(ts,:))
ylabel('$H_{rms}[m]$','interpreter','latex')
xlabel('$x[m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex')


x2p = interp_brad(out(ind).x,lidar(in(ind).lidar_ind).r2p-out(ind).zb);
figure(2);clf
plot(out(ind).x,out(ind).zb);hold all
plot(out(ind).x,out(ind).eta);hold all
plot(x2p,lidar(in(ind).lidar_ind).r2p,'rs','markerfacecolor','r','markersize',10)
plot(out(ind).runup_2p_x,out(ind).runup_2p,'ks','markerfacecolor','k','markersize',10)
ylabel('$z[m]$','interpreter','latex')
xlabel('$x[m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

figure(3);clf
plot(out(ind).x,out(ind).Ef);hold all
ylabel('$E_f$','interpreter','latex')
xlabel('$x[m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

figure(4);clf
plot([in.date],[lidar([in.lidar_ind]).r2p],'r','linewidth',3);hold all
plot([in.date],[out.runup_2p],'ks','markerfacecolor','k','markersize',8)
%plot([in.date],[out.runup_mean],'k-','markerfacecolor','k')
plot([in.date],[in.swlbc],'b-','linewidth',3);hold all
%plot([in.date],[out.surfsim],'b-','markerfacecolor','k')
ylabel('$R_{2\%}$','interpreter','latex')
%xlabel('$x[m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/r2p_ts.png']);end

figure(5);clf
rmse = sqrt(mean(([lidar([in.lidar_ind]).r2p]-[out.runup_2p]).^2));

plot([lidar([in.lidar_ind]).r2p],[out.runup_2p],'rs','markerfacecolor','k','markersize',8);hold all
plot([0 5],[0 5],'k','linewidth',2)
title('Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('Model','interpreter','latex','fontsize',fs)
xlabel('Data','interpreter','latex','fontsize',fs)
text(1,4,['RMSE = ',sprintf('%1.2f',rmse),' m'])
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
if iprint;print('-dpng','-r300',['./',g.name,'/r2p.png']);end


figure(6);clf
subplot(2,1,1)
plot([in.date],[in.Hrms],'b','linewidth',3);hold all
ylabel('$H_{rms} [m]$','interpreter','latex')
set(gca,'xticklabel',[])
subplot(2,1,2)
plot([in.date],[in.swlbc],'b-','linewidth',3);hold all
ylabel('$\eta [m]$','interpreter','latex')
xlabel('Date','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/bc.png']);end


figure();clf
hh=plot(in(1).x,reshape([in(1:20:end).zb],566,[]));
legend([hh(1) hh(end)],[datestr(in(1).date); datestr(in(end).date)],'location','northwest')
ylabel('$z_b [m]$','interpreter','latex')
xlabel('$x [m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
if iprint;print('-dpng','-r300',['./',g.name,'/zb.png']);end
