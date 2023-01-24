
load (['frf_runup/data/summary_bathy.mat'])
load (['frf_runup/data/summary_waves_bc.mat'])
load (['frf_runup/data/summary_wl.mat'])
load (['frf_runup/data/summary_lidar_science_small.mat'])
fs = 14
d = [lidar_sm.date];
wli = interp1(wl.date,wl.wl,d);
figure;clf
plot([lidar_sm.date],[lidar_sm.r2p],'k','linewidth',2);hold on
plot(d,wli,'b','linewidth',2)
plot(d,[lidar_sm.r2p]-wli,'r','linewidth',2)
xlim([7.3624e5  7.3625e5]) 
ylabel('$R_{2\%data}[m]$','interpreter','latex','fontsize',fs)
xlabel('$date$','interpreter','latex','fontsize',fs)
title('$R_{2\%}$','interpreter','latex','fontsize',fs)
set(gca,'TickLabelInterpreter','latex')
if 1;print('-dpng','-r300',['./frf_runup/r2p_vs_wl.png']);end
