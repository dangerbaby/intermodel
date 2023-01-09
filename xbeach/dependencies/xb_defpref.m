function xb_defpref()
%XB_DEFPREF  Sets default preferences for XBeach Toolbox
%
%   Sets default preferences for XBeach Toolbox
%
%   Syntax:
%   xb_defpref()
%
%   Input:
%   none
%
%   Output:
%   none
%
%   Example
%   xb_defpref;
%
%   See also xb_setpref, xb_getpref

%% Copyright notice
%   --------------------------------------------------------------------
%   Copyright (C) 2011 Deltares
%       Bas Hoonhout
%
%       bas.hoonhout@deltares.nl	
%
%       Rotterdamseweg 185
%       2629HD Delft
%
%   This library is free software: you can redistribute it and/or
%   modify it under the terms of the GNU Lesser General Public
%   License as published by the Free Software Foundation, either
%   version 2.1 of the License, or (at your option) any later version.
%
%   This library is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%   Lesser General Public License for more details.
%
%   You should have received a copy of the GNU Lesser General Public
%   License along with this library. If not, see <http://www.gnu.org/licenses/>.
%   --------------------------------------------------------------------

% This tool is part of <a href="http://OpenEarth.nl">OpenEarthTools</a>.
% OpenEarthTools is an online collaboration to share and manage data and 
% programming tools in an open source, version controlled environment.
% Sign up to recieve regular updates of this function, and to contribute 
% your own tools.

%% Version <http://svnbook.red-bean.com/en/1.5/svn.advanced.props.special.keywords.html>
% Created: 05 Jan 2011
% Created with Matlab version: 7.9.0.529 (R2009b)

% $Id$
% $Date$
% $Author$
% $Revision$
% $HeadURL$
% $Keywords: $

%% general
setpref('xbeach', 'version', 1.0);

%% xb_io
setpref('xbeach', 'dat_method', '');

%% xb_human
setpref('xbeach', 'interactive', true);

%% xb_modelsetup
setpref('xbeach', 'grid_finalise', {});

%% xb_run
setpref('xbeach', 'ssh_user', '');
setpref('xbeach', 'ssh_pass', '');

setpref('xbeach', 'runs', []);
setpref('xbeach', 'queue', []);

setpref('xbeach', 'interval', []);