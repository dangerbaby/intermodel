for i = 1:length(out_xbeach);xbr2p(i) = out_xbeach(i).runup.runup_2p;end

figure;clf
plot([dat.r2p],[xbr2p],'rs','markerfacecolor','k');hold on
plot([min([dat.r2p]) max([dat.r2p]) ],[min([dat.r2p]) max([dat.r2p]) ],'k','linewidth',2)
ylabel('$R_{2\%data}[m]$','interpreter','latex')
xlabel('$R_{2\%model}[m]$','interpreter','latex')
title('XBeach Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('Model','interpreter','latex','fontsize',fs)
xlabel('Data','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')
if iprint;print('-dpng','-r300',['./',g.name,'/xbeach_mod-dat_r2p.png']);end

figure;clf
plot([in.date],[dat.r2p],'r','linewidth',3);hold all
plot([in.date],[xbr2p],'ks','markerfacecolor','k','markersize',8)
plot([in.date],[in.swlbc],'b-','linewidth',3);hold all
title('XBeach Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('$R_{2\%}$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/xbeach_r2p_ts.png']);end

