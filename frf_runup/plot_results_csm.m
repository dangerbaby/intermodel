out = out_csm;
er = [out.runup_2p]-[dat.r2p];
rmser = sqrt(mean(er.^2))


figure;clf
plot([dat.r2p],[out.runup_2p],'rs','markerfacecolor','k');hold on
plot([min([dat.r2p]) max([dat.r2p]) ],[min([dat.r2p]) max([dat.r2p]) ],'k','linewidth',2)
ylabel('$R_{2\%data}[m]$','interpreter','latex')
xlabel('$R_{2\%model}[m]$','interpreter','latex')
title('CMS-type Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
ylabel('Model','interpreter','latex','fontsize',fs)
xlabel('Data','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')
text(1,4,['RSE = ',num2str(rmser),'[m]'],'interpreter','latex','fontsize',fs)
if iprint;print('-dpng','-r300',['./',g.name,'/csm_mod-dat_r2p.png']);end

figure;clf
%[Ib] = iribarren ([in.Hrms]*sqrt(2),[in.Tp],[in.beta_f])
ercoeff = polyfit([in.Ib],er,1)
plot([in.Ib],er,'rs','markerfacecolor','k');hold on
plot([in.Ib],ercoeff(2)+ercoeff(1)*[in.Ib],'k');hold on
text(.2,-1,['$\epsilon  = ',num2str(ercoeff(1)),' Ib + ',num2str(ercoeff(2)),'$'],'interpreter','latex','fontsize',fs)
%plot([in.Hrms],er,'rs','markerfacecolor','k');hold on
ylabel('Error in $pR_{2\%}[m]$','interpreter','latex')
xlabel('Ib','interpreter','latex')
title('CMS-type $R_{2\%}$','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')
%if iprint;print('-dpng','-r300',['./',g.name,'/csm_mod-dat_r2p.png']);end


figure;clf
plot([in.date],[dat.r2p],'r','linewidth',3);hold all
plot([in.date],[out.runup_2p],'ks','markerfacecolor','k','markersize',8)
plot([in.date],[in.swlbc],'b-','linewidth',3);hold all
ylabel('$R_{2\%}$','interpreter','latex')
title('CMS-type Model/Data $R_{2\%}$','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex','fontsize',fs)
datetick
if iprint;print('-dpng','-r300',['./',g.name,'/csm_r2p_ts.png']);end

