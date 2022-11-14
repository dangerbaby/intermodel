function [runup_pks] = upcross_runup(eta,dt);
% Zero upcrossing analysis function
% [Hrms Trms] = upcossing(eta,dt)
% Hrms is the upcrossing based RMS waveheight
% Trms is the upcrossing based RMS wave period
%
% [Hrms Trms positions numwaves waveheights periods] = ...
%                     upcrossing(eta,dt,[ident],[nbins],[returnresultsid],[plotid])
%
% ident is a string identifier, for example 'Test 3'. 
% nbins is the number of wave bins for pdf plot
% dt is 1/(sample frequency)
% returnresultsid =1 will return bins and number of waves 
% plotid = 1 will generate plot of histogram
%
% function [Hrms,Trms,pos,numwaves,wvht,periods] = upcrossing(eta,dt,ident,nbins,returnresults,plotid)
if nargin<3; ident= '';end
if nargin<3; ident= '';end
if nargin<4; nbins= 10;end
if nargin<5; returnresults= 0;end
if nargin<6; plotid = 1;end
eta2 = eta-mean(eta);
n = length(eta);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
etashift1 = eta2(1:n-1);etashift2 = eta2(2:n);
crsspt = find(etashift1.*etashift2<0&etashift2-etashift1>0);
% periods = ((crsspt(2:length(crsspt))-crsspt(1:length(crsspt)-1))*dt)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxfile = zeros(1,length(crsspt)-1);
minfile = zeros(1,length(crsspt)-1);
for j = 1:length(crsspt)-1
  maxfile(j) = max(eta(crsspt(j):crsspt(j+1)));
  minfile(j) = min(eta(crsspt(j):crsspt(j+1)));
end
runup_pks = maxfile;
% wvht=(maxfile-minfile);
% Hrms = sqrt(mean( wvht.^2));
% Trms = sqrt(mean( periods.^2));
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [swvht, inds] = sort(wvht);
% speriods = periods(inds);
% H12 = mean(swvht(ceil(1/2*length(swvht)):length(swvht)));
% H13 = mean(swvht(ceil(2/3*length(swvht)):length(swvht)));
% H110 = mean(swvht(ceil(9/10*length(swvht)):length(swvht)));
% T12 = mean(speriods(ceil(1/2*length(swvht)):length(swvht)));
% T13 = mean(speriods(ceil(2/3*length(swvht)):length(swvht)));
% T110 = mean(speriods(ceil(9/10*length(swvht)):length(swvht)));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [numwaves pos]=hist(wvht,nbins);hold on
% if plotid
%   figure(1);clf
%   hnd=bar(pos,numwaves);set(hnd,'facecolor',[.2 .5 .5]);
%   title(ident,'fontname','times','fontsize',12);
%   a = axis;
%   text(a(1)+(a(2)-a(1))*.6,a(3)+(a(4)-a(3))*.9, ...
%        ['H_{rms}  = ',num2str(Hrms), ...
% 	'  mean(H)  = ',num2str(mean(wvht))],'fontname','times')
%   text(a(1)+(a(2)-a(1))*.6,a(3)+(a(4)-a(3))*.85, ...
%        ['T_{rms}  = ',num2str(Trms), ...
% 	'  mean(T)  = ',num2str(mean(periods))],'fontname','times')
%   text(a(1)+(a(2)-a(1))*.6,a(3)+(a(4)-a(3))*.8, ...
%        ['H_{1/2}  = ',num2str(H12),'  T_{1/2}  = ',num2str(T12)],'fontname','times')
%   text(a(1)+(a(2)-a(1))*.6,a(3)+(a(4)-a(3))*.75, ...
%        ['H_{1/3}  = ',num2str(H13),'  T_{1/3}  = ',num2str(T13)],'fontname','times')
%   text(a(1)+(a(2)-a(1))*.6,a(3)+(a(4)-a(3))*.7, ...
%        ['H_{1/10}  = ',num2str(H110), ...
% 	'  T_{1/10}  = ',num2str(T110)],'fontname','times')
%   ylabel(['Number of Waves'],'fontname','times')
%   xlabel(['Waveheight (m)'],'fontname','times')
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


