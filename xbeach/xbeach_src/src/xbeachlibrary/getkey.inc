!  DO NOT EDIT THIS FILE
!  But edit variable.f90 and scripts/generate.py
!  Compiling and running is taken care of by the Makefile



 integer, parameter :: ncharacterkeys=35
 integer, parameter :: nrealkeys=132
 integer, parameter :: nintegerkeys=134

 character(slen), dimension(ncharacterkeys) :: characterkeys
 character(slen), dimension(nrealkeys) :: realkeys
 character(slen), dimension(nintegerkeys) :: integerkeys

 character(slen), dimension(ncharacterkeys) :: charactervalues
 double precision, dimension(nrealkeys) :: realvalues
 integer, dimension(nintegerkeys) :: integervalues


 characterkeys(1) = "depfile"
 characterkeys(2) = "xfile"
 characterkeys(3) = "yfile"
 characterkeys(4) = "xyfile"
 characterkeys(5) = "gridform_str"
 characterkeys(6) = "tunits"
 characterkeys(7) = "zsinitfile"
 characterkeys(8) = "wbctype_str"
 characterkeys(9) = "instat_str"
 characterkeys(10) = "leftwave_str"
 characterkeys(11) = "rightwave_str"
 characterkeys(12) = "bcfile"
 characterkeys(13) = "tidetype_str"
 characterkeys(14) = "zs0file"
 characterkeys(15) = "disch_loc_file"
 characterkeys(16) = "disch_timeseries_file"
 characterkeys(17) = "break_str"
 characterkeys(18) = "wavfricfile"
 characterkeys(19) = "bedfricfile"
 characterkeys(20) = "windfile"
 characterkeys(21) = "aquiferbotfile"
 characterkeys(22) = "gw0file"
 characterkeys(23) = "swtable"
 characterkeys(24) = "ne_layer"
 characterkeys(25) = "tsglobal"
 characterkeys(26) = "tspoints"
 characterkeys(27) = "tsmean"
 characterkeys(28) = "ncfilename"
 characterkeys(29) = "projection"
 characterkeys(30) = "drifterfile"
 characterkeys(31) = "shipfile"
 characterkeys(32) = "veggiefile"
 characterkeys(33) = "veggiemapfile"
 characterkeys(34) = "scheme_str"
 characterkeys(35) = "setbathyfile"
 charactervalues(1) = par%depfile
 charactervalues(2) = par%xfile
 charactervalues(3) = par%yfile
 charactervalues(4) = par%xyfile
 charactervalues(5) = par%gridform_str
 charactervalues(6) = par%tunits
 charactervalues(7) = par%zsinitfile
 charactervalues(8) = par%wbctype_str
 charactervalues(9) = par%instat_str
 charactervalues(10) = par%leftwave_str
 charactervalues(11) = par%rightwave_str
 charactervalues(12) = par%bcfile
 charactervalues(13) = par%tidetype_str
 charactervalues(14) = par%zs0file
 charactervalues(15) = par%disch_loc_file
 charactervalues(16) = par%disch_timeseries_file
 charactervalues(17) = par%break_str
 charactervalues(18) = par%wavfricfile
 charactervalues(19) = par%bedfricfile
 charactervalues(20) = par%windfile
 charactervalues(21) = par%aquiferbotfile
 charactervalues(22) = par%gw0file
 charactervalues(23) = par%swtable
 charactervalues(24) = par%ne_layer
 charactervalues(25) = par%tsglobal
 charactervalues(26) = par%tspoints
 charactervalues(27) = par%tsmean
 charactervalues(28) = par%ncfilename
 charactervalues(29) = par%projection
 charactervalues(30) = par%drifterfile
 charactervalues(31) = par%shipfile
 charactervalues(32) = par%veggiefile
 charactervalues(33) = par%veggiemapfile
 charactervalues(34) = par%scheme_str
 charactervalues(35) = par%setbathyfile

 realkeys(1) = "posdwn"
 realkeys(2) = "alfa"
 realkeys(3) = "dx"
 realkeys(4) = "dy"
 realkeys(5) = "xori"
 realkeys(6) = "yori"
 realkeys(7) = "thetamin"
 realkeys(8) = "thetamax"
 realkeys(9) = "dtheta"
 realkeys(10) = "dtheta_s"
 realkeys(11) = "tstop"
 realkeys(12) = "CFL"
 realkeys(13) = "dtset"
 realkeys(14) = "maxdtfac"
 realkeys(15) = "depthscale"
 realkeys(16) = "zs0"
 realkeys(17) = "taper"
 realkeys(18) = "Hrms"
 realkeys(19) = "Tm01"
 realkeys(20) = "Trep"
 realkeys(21) = "Tlong"
 realkeys(22) = "dir0"
 realkeys(23) = "nmax"
 realkeys(24) = "fcutoff"
 realkeys(25) = "trepfac"
 realkeys(26) = "sprdthr"
 realkeys(27) = "rt"
 realkeys(28) = "dtbc"
 realkeys(29) = "dthetaS_XB"
 realkeys(30) = "order"
 realkeys(31) = "epsi"
 realkeys(32) = "gamma"
 realkeys(33) = "gamma2"
 realkeys(34) = "alpha"
 realkeys(35) = "n"
 realkeys(36) = "gammax"
 realkeys(37) = "delta"
 realkeys(38) = "wavfriccoef"
 realkeys(39) = "fwcutoff"
 realkeys(40) = "breakerdelay"
 realkeys(41) = "facsd"
 realkeys(42) = "facrun"
 realkeys(43) = "beta"
 realkeys(44) = "hwci"
 realkeys(45) = "hwcimax"
 realkeys(46) = "cats"
 realkeys(47) = "bedfriccoef"
 realkeys(48) = "maxcf"
 realkeys(49) = "nuhfac"
 realkeys(50) = "nuhv"
 realkeys(51) = "gamma_turb"
 realkeys(52) = "lat"
 realkeys(53) = "Cd"
 realkeys(54) = "windth"
 realkeys(55) = "dwetlayer"
 realkeys(56) = "aquiferbot"
 realkeys(57) = "gw0"
 realkeys(58) = "gwReturb"
 realkeys(59) = "vonkar"
 realkeys(60) = "vicmol"
 realkeys(61) = "sigfac"
 realkeys(62) = "deltar"
 realkeys(63) = "rwave"
 realkeys(64) = "solver_acc"
 realkeys(65) = "solver_urelax"
 realkeys(66) = "kdmin"
 realkeys(67) = "Topt"
 realkeys(68) = "breakviscfac"
 realkeys(69) = "maxbrsteep"
 realkeys(70) = "secbrsteep"
 realkeys(71) = "reformsteep"
 realkeys(72) = "breakvisclen"
 realkeys(73) = "nhlay"
 realkeys(74) = "dzg1"
 realkeys(75) = "dzg2"
 realkeys(76) = "dzg3"
 realkeys(77) = "por"
 realkeys(78) = "ws"
 realkeys(79) = "BRfac"
 realkeys(80) = "facsl"
 realkeys(81) = "z0"
 realkeys(82) = "smax"
 realkeys(83) = "tsfac"
 realkeys(84) = "facua"
 realkeys(85) = "facSk"
 realkeys(86) = "facAs"
 realkeys(87) = "Tbfac"
 realkeys(88) = "Tsmin"
 realkeys(89) = "betad"
 realkeys(90) = "facDc"
 realkeys(91) = "jetfac"
 realkeys(92) = "rheeA"
 realkeys(93) = "pormax"
 realkeys(94) = "reposeangle"
 realkeys(95) = "bdslpeffdirfac"
 realkeys(96) = "ci"
 realkeys(97) = "phit"
 realkeys(98) = "bermslope"
 realkeys(99) = "bermslopefac"
 realkeys(100) = "bermslopegamma"
 realkeys(101) = "bermslopedepth"
 realkeys(102) = "morfac"
 realkeys(103) = "morstart"
 realkeys(104) = "morstop"
 realkeys(105) = "wetslp"
 realkeys(106) = "dryslp"
 realkeys(107) = "lsgrad"
 realkeys(108) = "hswitch"
 realkeys(109) = "dzmax"
 realkeys(110) = "tstart"
 realkeys(111) = "tint"
 realkeys(112) = "tintg"
 realkeys(113) = "tintp"
 realkeys(114) = "tintc"
 realkeys(115) = "tintm"
 realkeys(116) = "Kp"
 realkeys(117) = "Cm"
 realkeys(118) = "wavint"
 realkeys(119) = "maxerror"
 realkeys(120) = "eps"
 realkeys(121) = "eps_sd"
 realkeys(122) = "umin"
 realkeys(123) = "hmin"
 realkeys(124) = "thetanum"
 realkeys(125) = "cmax"
 realkeys(126) = "frac_dz"
 realkeys(127) = "split"
 realkeys(128) = "merge"
 realkeys(129) = "px"
 realkeys(130) = "dt"
 realkeys(131) = "t"
 realkeys(132) = "tnext"
 realvalues(1) = par%posdwn
 realvalues(2) = par%alfa
 realvalues(3) = par%dx
 realvalues(4) = par%dy
 realvalues(5) = par%xori
 realvalues(6) = par%yori
 realvalues(7) = par%thetamin
 realvalues(8) = par%thetamax
 realvalues(9) = par%dtheta
 realvalues(10) = par%dtheta_s
 realvalues(11) = par%tstop
 realvalues(12) = par%CFL
 realvalues(13) = par%dtset
 realvalues(14) = par%maxdtfac
 realvalues(15) = par%depthscale
 realvalues(16) = par%zs0
 realvalues(17) = par%taper
 realvalues(18) = par%Hrms
 realvalues(19) = par%Tm01
 realvalues(20) = par%Trep
 realvalues(21) = par%Tlong
 realvalues(22) = par%dir0
 realvalues(23) = par%nmax
 realvalues(24) = par%fcutoff
 realvalues(25) = par%trepfac
 realvalues(26) = par%sprdthr
 realvalues(27) = par%rt
 realvalues(28) = par%dtbc
 realvalues(29) = par%dthetaS_XB
 realvalues(30) = par%order
 realvalues(31) = par%epsi
 realvalues(32) = par%gamma
 realvalues(33) = par%gamma2
 realvalues(34) = par%alpha
 realvalues(35) = par%n
 realvalues(36) = par%gammax
 realvalues(37) = par%delta
 realvalues(38) = par%wavfriccoef
 realvalues(39) = par%fwcutoff
 realvalues(40) = par%breakerdelay
 realvalues(41) = par%facsd
 realvalues(42) = par%facrun
 realvalues(43) = par%beta
 realvalues(44) = par%hwci
 realvalues(45) = par%hwcimax
 realvalues(46) = par%cats
 realvalues(47) = par%bedfriccoef
 realvalues(48) = par%maxcf
 realvalues(49) = par%nuhfac
 realvalues(50) = par%nuhv
 realvalues(51) = par%gamma_turb
 realvalues(52) = par%lat
 realvalues(53) = par%Cd
 realvalues(54) = par%windth
 realvalues(55) = par%dwetlayer
 realvalues(56) = par%aquiferbot
 realvalues(57) = par%gw0
 realvalues(58) = par%gwReturb
 realvalues(59) = par%vonkar
 realvalues(60) = par%vicmol
 realvalues(61) = par%sigfac
 realvalues(62) = par%deltar
 realvalues(63) = par%rwave
 realvalues(64) = par%solver_acc
 realvalues(65) = par%solver_urelax
 realvalues(66) = par%kdmin
 realvalues(67) = par%Topt
 realvalues(68) = par%breakviscfac
 realvalues(69) = par%maxbrsteep
 realvalues(70) = par%secbrsteep
 realvalues(71) = par%reformsteep
 realvalues(72) = par%breakvisclen
 realvalues(73) = par%nhlay
 realvalues(74) = par%dzg1
 realvalues(75) = par%dzg2
 realvalues(76) = par%dzg3
 realvalues(77) = par%por
 realvalues(78) = par%ws
 realvalues(79) = par%BRfac
 realvalues(80) = par%facsl
 realvalues(81) = par%z0
 realvalues(82) = par%smax
 realvalues(83) = par%tsfac
 realvalues(84) = par%facua
 realvalues(85) = par%facSk
 realvalues(86) = par%facAs
 realvalues(87) = par%Tbfac
 realvalues(88) = par%Tsmin
 realvalues(89) = par%betad
 realvalues(90) = par%facDc
 realvalues(91) = par%jetfac
 realvalues(92) = par%rheeA
 realvalues(93) = par%pormax
 realvalues(94) = par%reposeangle
 realvalues(95) = par%bdslpeffdirfac
 realvalues(96) = par%ci
 realvalues(97) = par%phit
 realvalues(98) = par%bermslope
 realvalues(99) = par%bermslopefac
 realvalues(100) = par%bermslopegamma
 realvalues(101) = par%bermslopedepth
 realvalues(102) = par%morfac
 realvalues(103) = par%morstart
 realvalues(104) = par%morstop
 realvalues(105) = par%wetslp
 realvalues(106) = par%dryslp
 realvalues(107) = par%lsgrad
 realvalues(108) = par%hswitch
 realvalues(109) = par%dzmax
 realvalues(110) = par%tstart
 realvalues(111) = par%tint
 realvalues(112) = par%tintg
 realvalues(113) = par%tintp
 realvalues(114) = par%tintc
 realvalues(115) = par%tintm
 realvalues(116) = par%Kp
 realvalues(117) = par%Cm
 realvalues(118) = par%wavint
 realvalues(119) = par%maxerror
 realvalues(120) = par%eps
 realvalues(121) = par%eps_sd
 realvalues(122) = par%umin
 realvalues(123) = par%hmin
 realvalues(124) = par%thetanum
 realvalues(125) = par%cmax
 realvalues(126) = par%frac_dz
 realvalues(127) = par%split
 realvalues(128) = par%merge
 realvalues(129) = par%px
 realvalues(130) = par%dt
 realvalues(131) = par%t
 realvalues(132) = par%tnext

 integerkeys(1) = "useXBeachGSettings"
 integerkeys(2) = "wavemodel"
 integerkeys(3) = "cyclic"
 integerkeys(4) = "swave"
 integerkeys(5) = "lwave"
 integerkeys(6) = "flow"
 integerkeys(7) = "sedtrans"
 integerkeys(8) = "morphology"
 integerkeys(9) = "avalanching"
 integerkeys(10) = "nonh"
 integerkeys(11) = "gwflow"
 integerkeys(12) = "q3d"
 integerkeys(13) = "swrunup"
 integerkeys(14) = "ships"
 integerkeys(15) = "vegetation"
 integerkeys(16) = "snells"
 integerkeys(17) = "single_dir"
 integerkeys(18) = "bchwiz"
 integerkeys(19) = "setbathy"
 integerkeys(20) = "viscosity"
 integerkeys(21) = "advection"
 integerkeys(22) = "wind"
 integerkeys(23) = "nx"
 integerkeys(24) = "ny"
 integerkeys(25) = "nz"
 integerkeys(26) = "vardx"
 integerkeys(27) = "thetanaut"
 integerkeys(28) = "gridform"
 integerkeys(29) = "defuse"
 integerkeys(30) = "hotstartflow"
 integerkeys(31) = "wbctype"
 integerkeys(32) = "instat"
 integerkeys(33) = "m"
 integerkeys(34) = "lateralwave"
 integerkeys(35) = "leftwave"
 integerkeys(36) = "rightwave"
 integerkeys(37) = "bclwonly"
 integerkeys(38) = "Sfold"
 integerkeys(39) = "random"
 integerkeys(40) = "nspr"
 integerkeys(41) = "correctHm0"
 integerkeys(42) = "Tm01switch"
 integerkeys(43) = "nspectrumloc"
 integerkeys(44) = "wbcversion"
 integerkeys(45) = "nonhspectrum"
 integerkeys(46) = "front"
 integerkeys(47) = "left"
 integerkeys(48) = "right"
 integerkeys(49) = "back"
 integerkeys(50) = "ARC"
 integerkeys(51) = "highcomp"
 integerkeys(52) = "freewave"
 integerkeys(53) = "nc"
 integerkeys(54) = "tidetype"
 integerkeys(55) = "tideloc"
 integerkeys(56) = "paulrevere"
 integerkeys(57) = "ndischarge"
 integerkeys(58) = "ntdischarge"
 integerkeys(59) = "break"
 integerkeys(60) = "shoaldelay"
 integerkeys(61) = "roller"
 integerkeys(62) = "rfb"
 integerkeys(63) = "wci"
 integerkeys(64) = "bedfriction"
 integerkeys(65) = "smag"
 integerkeys(66) = "friction_infiltration"
 integerkeys(67) = "friction_turbulence"
 integerkeys(68) = "friction_acceleration"
 integerkeys(69) = "gwnonh"
 integerkeys(70) = "gwfastsolve"
 integerkeys(71) = "gwscheme"
 integerkeys(72) = "gwheadmodel"
 integerkeys(73) = "gwhorinfil"
 integerkeys(74) = "kmax"
 integerkeys(75) = "solver"
 integerkeys(76) = "solver_maxit"
 integerkeys(77) = "nhbreaker"
 integerkeys(78) = "nonhq3d"
 integerkeys(79) = "ngd"
 integerkeys(80) = "nd"
 integerkeys(81) = "waveform"
 integerkeys(82) = "form"
 integerkeys(83) = "sws"
 integerkeys(84) = "lws"
 integerkeys(85) = "turbadv"
 integerkeys(86) = "turb"
 integerkeys(87) = "lwt"
 integerkeys(88) = "sus"
 integerkeys(89) = "bed"
 integerkeys(90) = "bulk"
 integerkeys(91) = "fallvelred"
 integerkeys(92) = "dilatancy"
 integerkeys(93) = "bdslpeffmag"
 integerkeys(94) = "bdslpeffini"
 integerkeys(95) = "bdslpeffdir"
 integerkeys(96) = "incldzdx"
 integerkeys(97) = "inclrelweight"
 integerkeys(98) = "streaming"
 integerkeys(99) = "sedfricfac"
 integerkeys(100) = "slopecorr"
 integerkeys(101) = "phaselag"
 integerkeys(102) = "bermslopetransport"
 integerkeys(103) = "bermslopebed"
 integerkeys(104) = "bermslopesus"
 integerkeys(105) = "morfacopt"
 integerkeys(106) = "struct"
 integerkeys(107) = "timings"
 integerkeys(108) = "nglobalvar"
 integerkeys(109) = "nmeanvar"
 integerkeys(110) = "npointvar"
 integerkeys(111) = "npoints"
 integerkeys(112) = "nrugauge"
 integerkeys(113) = "nrugdepth"
 integerkeys(114) = "outputformat"
 integerkeys(115) = "outputprecision"
 integerkeys(116) = "rotate"
 integerkeys(117) = "remdryoutput"
 integerkeys(118) = "ndrifter"
 integerkeys(119) = "nship"
 integerkeys(120) = "nveg"
 integerkeys(121) = "vegnonlin"
 integerkeys(122) = "vegcanflo"
 integerkeys(123) = "veguntow"
 integerkeys(124) = "porcanflow"
 integerkeys(125) = "scheme"
 integerkeys(126) = "maxiter"
 integerkeys(127) = "secorder"
 integerkeys(128) = "oldhu"
 integerkeys(129) = "sourcesink"
 integerkeys(130) = "nd_var"
 integerkeys(131) = "nsetbathy"
 integerkeys(132) = "mpiboundary"
 integerkeys(133) = "mmpi"
 integerkeys(134) = "nmpi"
 integervalues(1) = par%useXBeachGSettings
 integervalues(2) = par%wavemodel
 integervalues(3) = par%cyclic
 integervalues(4) = par%swave
 integervalues(5) = par%lwave
 integervalues(6) = par%flow
 integervalues(7) = par%sedtrans
 integervalues(8) = par%morphology
 integervalues(9) = par%avalanching
 integervalues(10) = par%nonh
 integervalues(11) = par%gwflow
 integervalues(12) = par%q3d
 integervalues(13) = par%swrunup
 integervalues(14) = par%ships
 integervalues(15) = par%vegetation
 integervalues(16) = par%snells
 integervalues(17) = par%single_dir
 integervalues(18) = par%bchwiz
 integervalues(19) = par%setbathy
 integervalues(20) = par%viscosity
 integervalues(21) = par%advection
 integervalues(22) = par%wind
 integervalues(23) = par%nx
 integervalues(24) = par%ny
 integervalues(25) = par%nz
 integervalues(26) = par%vardx
 integervalues(27) = par%thetanaut
 integervalues(28) = par%gridform
 integervalues(29) = par%defuse
 integervalues(30) = par%hotstartflow
 integervalues(31) = par%wbctype
 integervalues(32) = par%instat
 integervalues(33) = par%m
 integervalues(34) = par%lateralwave
 integervalues(35) = par%leftwave
 integervalues(36) = par%rightwave
 integervalues(37) = par%bclwonly
 integervalues(38) = par%Sfold
 integervalues(39) = par%random
 integervalues(40) = par%nspr
 integervalues(41) = par%correctHm0
 integervalues(42) = par%Tm01switch
 integervalues(43) = par%nspectrumloc
 integervalues(44) = par%wbcversion
 integervalues(45) = par%nonhspectrum
 integervalues(46) = par%front
 integervalues(47) = par%left
 integervalues(48) = par%right
 integervalues(49) = par%back
 integervalues(50) = par%ARC
 integervalues(51) = par%highcomp
 integervalues(52) = par%freewave
 integervalues(53) = par%nc
 integervalues(54) = par%tidetype
 integervalues(55) = par%tideloc
 integervalues(56) = par%paulrevere
 integervalues(57) = par%ndischarge
 integervalues(58) = par%ntdischarge
 integervalues(59) = par%break
 integervalues(60) = par%shoaldelay
 integervalues(61) = par%roller
 integervalues(62) = par%rfb
 integervalues(63) = par%wci
 integervalues(64) = par%bedfriction
 integervalues(65) = par%smag
 integervalues(66) = par%friction_infiltration
 integervalues(67) = par%friction_turbulence
 integervalues(68) = par%friction_acceleration
 integervalues(69) = par%gwnonh
 integervalues(70) = par%gwfastsolve
 integervalues(71) = par%gwscheme
 integervalues(72) = par%gwheadmodel
 integervalues(73) = par%gwhorinfil
 integervalues(74) = par%kmax
 integervalues(75) = par%solver
 integervalues(76) = par%solver_maxit
 integervalues(77) = par%nhbreaker
 integervalues(78) = par%nonhq3d
 integervalues(79) = par%ngd
 integervalues(80) = par%nd
 integervalues(81) = par%waveform
 integervalues(82) = par%form
 integervalues(83) = par%sws
 integervalues(84) = par%lws
 integervalues(85) = par%turbadv
 integervalues(86) = par%turb
 integervalues(87) = par%lwt
 integervalues(88) = par%sus
 integervalues(89) = par%bed
 integervalues(90) = par%bulk
 integervalues(91) = par%fallvelred
 integervalues(92) = par%dilatancy
 integervalues(93) = par%bdslpeffmag
 integervalues(94) = par%bdslpeffini
 integervalues(95) = par%bdslpeffdir
 integervalues(96) = par%incldzdx
 integervalues(97) = par%inclrelweight
 integervalues(98) = par%streaming
 integervalues(99) = par%sedfricfac
 integervalues(100) = par%slopecorr
 integervalues(101) = par%phaselag
 integervalues(102) = par%bermslopetransport
 integervalues(103) = par%bermslopebed
 integervalues(104) = par%bermslopesus
 integervalues(105) = par%morfacopt
 integervalues(106) = par%struct
 integervalues(107) = par%timings
 integervalues(108) = par%nglobalvar
 integervalues(109) = par%nmeanvar
 integervalues(110) = par%npointvar
 integervalues(111) = par%npoints
 integervalues(112) = par%nrugauge
 integervalues(113) = par%nrugdepth
 integervalues(114) = par%outputformat
 integervalues(115) = par%outputprecision
 integervalues(116) = par%rotate
 integervalues(117) = par%remdryoutput
 integervalues(118) = par%ndrifter
 integervalues(119) = par%nship
 integervalues(120) = par%nveg
 integervalues(121) = par%vegnonlin
 integervalues(122) = par%vegcanflo
 integervalues(123) = par%veguntow
 integervalues(124) = par%porcanflow
 integervalues(125) = par%scheme
 integervalues(126) = par%maxiter
 integervalues(127) = par%secorder
 integervalues(128) = par%oldhu
 integervalues(129) = par%sourcesink
 integervalues(130) = par%nd_var
 integervalues(131) = par%nsetbathy
 integervalues(132) = par%mpiboundary
 integervalues(133) = par%mmpi
 integervalues(134) = par%nmpi
