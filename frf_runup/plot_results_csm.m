iprint = 1;
fs = 24;
out = out_csm;

figure(1);clf
plot([dat.r2p],[out.runup_2p],'rs','markerfacecolor','k')
ylabel('$H_{rms}[m]$','interpreter','latex')
xlabel('$x[m]$','interpreter','latex')
title('Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('Model','interpreter','latex','fontsize',fs)
xlabel('Data','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')



figure(2);clf
plot([in.date],[dat.r2p],'r','linewidth',3);hold all
plot([in.date],[out.runup_2p],'ks','markerfacecolor','k','markersize',8)
plot([in.date],[in.swlbc],'b-','linewidth',3);hold all
%plot([in.date],[out.surfsim],'b-','markerfacecolor','k')
ylabel('$R_{2\%}$','interpreter','latex')
%xlabel('$x[m]$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/r2p_ts.png']);end

return

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
