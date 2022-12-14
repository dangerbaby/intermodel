  !  DO NOT EDIT THIS FILE
  !  But edit variables.f90 and scripts/generate.py
  !  Compiling and running is taken care of by the Makefile

<%
# this list is copied to writeloginterface.f90
formats = ["a", "afafafaf", "afaiaaa", "aaafaf", "aafaf", "afaaa", "aafa", "aaaf",
"afafa", "afaf", "afa", "aaf", "iiiii", "aiaiafa",
"aiaiaf", "aiaiaia", "aiaiai", "aiafaf", "aiafa", "aaaiai",
"aaiai", "aiai", "aiaaa", "aaai",
"aii", "aai", "aaaa", "aaa", "ai", "aa",  "illll", "af",
"aia", "ia", "fa","aaia","aiaa", "aiaia"]


format2name = {
"a": "message_char",
"i": "message_int",
"f": "message_float",
"l": "message_logical"
}
format2type = {
"a": "character(*)",
"i": "integer",
"f": "real*8",
"l": "logical"
}

def format2vars(format):
    """convert a format code to a list of variables"""
    variables = []
    counter = {}
    for letter in format:
        counter[letter] = 0
    for letter in format:
        counter[letter] += 1
        n = counter[letter]
        # prepend with name to avoid interface colission
        name = format + "_" + format2name[letter] + str(n)
        type = format2type[letter]
        variable = {"name": name,
                    "type": type,
                    "letter": letter}
        variables.append(variable)
    return variables

def vars2write(variables):
    """convert variable list to write statement"""
    writes = []
    for var in variables:
        if var["letter"] == "a":
            # trim the strings
            writes.append("trim({0})".format(var["name"]))
        else:
            writes.append(var["name"])
    # concatenate them all separated by ", "
    write = ", ".join(writes)
    return write
%>

%for format in formats:

<%
# define formatting for variables
variables = format2vars(format)
# concatenate all the variables by ,
names = ", ".join(var["name"] for var in variables)
# generate the write statements
write = vars2write(variables)
%>

subroutine writelog_${format}(destination, form, ${names})
  implicit none
  character(*),intent(in)    ::  destination
  character(*),intent(in)    ::  form
  character(len=slen) :: display
%for var in variables:
  ${var["type"]}, intent(in) :: ${var["name"]}
%endfor
  if (trim(form)=='') then
    write(display,*)${write}
  else
    write(display,form)${write}
  endif
%if format == 'a':
  ! this is the main subroutine that actual does the logging
  ! passing the trimmed version of display does not work.
  call writelog_distribute(destination, trim(display))
%else:
  ! this function passes the formatted log messages to the main logger
  call writelog_a(destination, '', trim(display))
%endif
end subroutine writelog_${format}
%endfor
