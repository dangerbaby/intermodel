for i = 1:length(out_xbeachnonhydro);
 if ~isempty(out_xbeachnonhydro(i).runup_2p); xbr2p(i) = out_xbeachnonhydro(i).runup_2p;
 else;  xbr2p(i) = nan;
 end
end
numsim = length(out_xbeachnonhydro);
%numsim = 45;
figure;clf
plot([dat(1:numsim).r2p],[xbr2p],'rs','markerfacecolor','k');hold on
plot([min([dat(1:numsim).r2p]) max([dat(1:numsim).r2p]) ],[min([dat(1:numsim).r2p]) max([dat(1:numsim).r2p]) ],'k','linewidth',2)
ylabel('$R_{2\%data}[m]$','interpreter','latex')
xlabel('$R_{2\%model}[m]$','interpreter','latex')
title('XBeach-NH Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('Model','interpreter','latex','fontsize',fs)
xlabel('Data','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')
if iprint;print('-dpng','-r300',['./',g.name,'/xbeachNH_mod-dat_r2p.png']);end

figure;clf
plot([in(1:numsim).date],[dat(1:numsim).r2p],'r','linewidth',3);hold all
plot([in(1:numsim).date],[xbr2p],'ks','markerfacecolor','k','markersize',8)
plot([in(1:numsim).date],[in(1:numsim).swlbc],'b-','linewidth',3);hold all
title('XBeach-NH Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('$R_{2\%}$','interpreter','latex')
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/xbeachNH_r2p_ts.png']);end

