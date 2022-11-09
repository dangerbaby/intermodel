!  DO NOT EDIT THIS FILE
!  But edit spaceparams.tmpl and/or makeincludes.F90
!  compile makeincludes.F90 and run the compilate
!  Compiling and running is taken care of by the Makefile

<%
def dimstr(variable):
    if not variable['rank']:
        txt = ''
    else:
        txt = 'dimension({colons}), '.format(
            colons=','.join(':'*variable['rank'])
        )
    return txt
%>
%for variable in variables:
    ${variable['fortrantype']}, ${dimstr(variable)} pointer :: ${variable['name']}
%endfor
!directions for vi vim: filetype=fortran : syntax=fortran