!  DO NOT EDIT THIS FILE
!  But edit variable.f90 and scripts/generate.py
!  Compiling and running is taken care of by the Makefile

<%
realparams = []
integerparams = []
characterparams = []
for par in parameters:
  if par["type"] == "double":
    if par["name"] not in ("D15", "D50", "D90", "sedcal", "ucrcal", "xpointsw", "ypointsw", "rugdepth"):
      realparams.append(par)
  if par["type"] == "int":
    if par["name"] not in ("pointtypes"):
      integerparams.append(par)
  if par["type"] == "char":
    if par["name"] not in ("globalvars", "meanvars", "pointvars", "stationid"):
      characterparams.append(par)
%>

 integer, parameter :: ncharacterkeys=${len(characterparams)}
 integer, parameter :: nrealkeys=${len(realparams)}
 integer, parameter :: nintegerkeys=${len(integerparams)}

 character(slen), dimension(ncharacterkeys) :: characterkeys
 character(slen), dimension(nrealkeys) :: realkeys
 character(slen), dimension(nintegerkeys) :: integerkeys

 character(slen), dimension(ncharacterkeys) :: charactervalues
 double precision, dimension(nrealkeys) :: realvalues
 integer, dimension(nintegerkeys) :: integervalues


%for i, par in enumerate(characterparams):
 characterkeys(${i+1}) = "${par["name"]}"
%endfor
%for i, par in enumerate(characterparams):
 charactervalues(${i+1}) = par%${par["name"]}
%endfor

%for i, par in enumerate(realparams):
 realkeys(${i+1}) = "${par["name"]}"
%endfor
%for i, par in enumerate(realparams):
 realvalues(${i+1}) = par%${par["name"]}
%endfor

%for i, par in enumerate(integerparams):
 integerkeys(${i+1}) = "${par["name"]}"
%endfor
%for i, par in enumerate(integerparams):
 integervalues(${i+1}) = par%${par["name"]}
%endfor
