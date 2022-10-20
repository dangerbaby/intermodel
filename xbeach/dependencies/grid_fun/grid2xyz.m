function [x,y,z] = grid2xyz(Xgrid, Ygrid, Zgrid)
%GRID2XYZ converts a grid to xyz and removes NaN's
%
%   Syntax:
%   [x,y,z] = grid2xyz(Xgrid, Ygrid, Zgrid)
%
%   Input:
%   Xgrid = x grid coordinates
%   Ygrid = y grid coordinates
%   Zgrid = z grid coordinates
%
%   Output:
%   x = x coordinate (vector)
%   y = y coordinate (vector)
%   z = z coordinate (vector)
%
%   Example
%   [x,y,z] = grid2xyz(Xgrid, Ygrid, Zgrid)
%
%   See also 

%% Copyright notice
%   --------------------------------------------------------------------
%   Copyright (C) 2010 Alkyon Hydraulic Consultancy & Research
%       grasmeijerb
%
%       bart.grasmeijer@alkyon.nl	
%
%       P.O. Box 248
%       8300 AE Emmeloord
%       The Netherlands
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
% Created: 05 Jul 2010
% Created with Matlab version: 7.10.0.499 (R2010a)

% $Id: grid2xyz.m 2797 2010-07-06 19:28:55Z b.t.grasmeijer@arcadis.nl $
% $Date: 2010-07-06 15:28:55 -0400 (Tue, 06 Jul 2010) $
% $Author: b.t.grasmeijer@arcadis.nl $
% $Revision: 2797 $
% $HeadURL: https://svn.oss.deltares.nl/repos/openearthtools/trunk/matlab/general/grid_fun/grid2xyz.m $
% $Keywords: $

%%

x = reshape(Xgrid,[numel(Xgrid),1]);
y = reshape(Ygrid,[numel(Ygrid),1]);
z = reshape(Zgrid,[numel(Zgrid),1]);
mynans = isnan(x) | isnan(y) | isnan(z);
x(mynans) = [];
y(mynans) = [];
z(mynans) = [];




