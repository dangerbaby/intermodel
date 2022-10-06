function [out] = run_cshore(g,in2)
if g.icshore==0;out = [];return;end
disp('Running CSHORE')
addpath(['./cshore'])
exec_cmd = './cshore/CSHORE_USACE_LINUX.out';
%first make the infiles
in.header = {'------------------------------------------------------------'
             'CSHORE applied to FRF cross-shore array for runup'
             '------------------------------------------------------------'};
in.iline  = 1;       % 1 = single line
in.iprofl = 0;       % 0 = no morph, 1 = run morph
in.isedav = 0;       % 0 = unlimited sand, 1 = hard bottom
in.iperm  = 0;       % 0 = no permeability, 1 = permeable
in.iover  = 1;       % 0 = no overtopping , 1 = include overtopping
in.infilt = 0;       % 1 = include infiltration landward of dune crest
in.iwtran = 0;       % 0 = no standing water landward of crest,
                     % 1 = wave transmission due to overtopping
in.ipond  = 0;       % 0 = no ponding seaward of SWL
in.iwcint = 0;       % 0 = no W & C interaction , 1 = include W & C interaction
in.iroll  = 0;       % 0 = no roller, 1 = roller
in.iwind  = 0;       % 0 = no wind effect
in.itide  = 0;       % 0 = no tidal effect on currents
in.iveg   = 0;          % vegitation effect
in.dx     = in2.dx;       % constant dx 
in.gamma  = in2.gamma;      % shallow water ratio of wave height to water depth
in.rwh = .01;        % numerical rununp wire height 
in.ilab = 1;         % controls the boundary condition timing.
                     %in.fric_fac = in2.fric_fac;  % bottom friction factor
ftime = 0; % [sec] final time, dictates model duration
dt = 3600;
in.timebc_wave = [0:dt:ftime];
in.timebc_surg = in.timebc_wave;
in.nwave = length(in.timebc_wave); in.nsurg = in.nwave;dum = ones(1,in.nwave);



for i = 1:length(in2)
  in.Tp= in2(i).Tm;        % constant spectral peak period in seconds
  in.Hrms = in2(i).Hrms;
  in.Wsetup = 0;   % wave setup at seaward boundary in meters
  in.swlbc = in2(i).swlbc; % water level at seaward boundary in meters
  in.angle = in2(i).angle;    % constant incident wave angle at seaward boundary in
  in.x = in2(i).x;
  in.zb = in2(i).zb;
  in.fw = in2(i).fric_fac*ones(size(in.zb)); % cross-shore values of bot fric
  makeinfile_usace(in);
  system([exec_cmd]);
  out(i).results= load_results_usace;
  delete('O*','infile')

end






