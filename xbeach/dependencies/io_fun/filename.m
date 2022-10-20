function NAME = filename(fullfilename)
%FILENAME   Returns NAME from       [PATHSTR,NAME,EXT] = FILEPARTS(FILE).
%
% Note that FILENAME is vectorized, whereas FILEPARTS is not.
%
% See also:
% FILEPARTS, FILEPATHSTR, FILEEXT, FILENAMEEXT, FULLFILE, FILEPATHSTRNAME

% $Id: filename.m 5104 2011-08-23 10:24:20Z boer_g $
% $Date: 2011-08-23 06:24:20 -0400 (Tue, 23 Aug 2011) $
% $Author: boer_g $
% $Revision: 5104 $
% $HeadURL: https://svn.oss.deltares.nl/repos/openearthtools/trunk/matlab/general/io_fun/filename.m $
% $Keywords$

if iscellstr(fullfilename)
    fullfilename = char(fullfilename);
end

for iname=1:size(fullfilename,1)

   [PATHSTR{iname},NAME{iname},EXT{iname}] = fileparts(fullfilename(iname,:));

end 

NAME = char(NAME);

% Feb 2008, vectorized.

%   --------------------------------------------------------------------
%   Copyright (C) 2005-8 Delft University of Technology
%       Gerben J. de Boer
%
%       g.j.deboer@tudelft.nl	
%
%       Fluid Mechanics Section
%       Faculty of Civil Engineering and Geosciences
%       PO Box 5048
%       2600 GA Delft
%       The Netherlands
%
%   This library is free software; you can redistribute it and/or
%   modify it under the terms of the GNU Lesser General Public
%   License as published by the Free Software Foundation; either
%   version 2.1 of the License, or (at your option) any later version.
%
%   This library is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%   Lesser General Public License for more details.
%
%   You should have received a copy of the GNU Lesser General Public
%   License along with this library; if not, write to the Free Software
%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
%   USA
%   or http://www.gnu.org/licenses/licenses.html, http://www.gnu.org/, http://www.fsf.org/
%   --------------------------------------------------------------------

%% EOF