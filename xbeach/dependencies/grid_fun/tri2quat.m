function varargout = tri2quat(tri,varargin)
%TRI2QUAT   triangulate curvi-linear mesh
%
%    [..] = tri2quat(tri,quat)
%    [..] = tri2quat(tri,x,y)
%
%                           S = tri2quat(...)
% [tri_per_quat,quat_per_tri] = tri2quat(...)
%
% Returns a struct with fields:
% - tri_per_quat
% - quat_per_tri
% where 
%
% every triangle belongs to exactly 1 quadrangle (no more, no less)
% every quadrangle      has exactly 2 traingles  (no more, no less)
%
% tri  is generated by for instance DELAUNAY() or TRIQUAT()
% quat is generated by for instance QUAT()
%
% see also: TRIQUAT, QUAT, DELAUNAY, GRADIENT2

%% Copyright
%   --------------------------------------------------------------------
%   Copyright (C) 2005 Delft University of Technology
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

   if nargin==3
   
      x      = varargin{1};
      y      = varargin{2};
      
      szcor1 = size(x,1);
      szcor2 = size(x,2);
      
      szcen1 = szcor1-1;
      szcen2 = szcor2-1;
      
      q      = quat(x,y);
   
   elseif nargin==2
   
      q      = varargin{1};
   
   end

   ntri  = size(tri,1);
   nquat = size(q  ,1);

   quat_per_tri = repmat(0,[ntri  1]);
   tri_per_quat = repmat(0,[nquat 2]);

%% every triangle belongs to exactly 1 quadrangle (no more, no less)
%  every quadrangle has exactly 2 traingles (no more, no less)
   
   for itri = 1:ntri
   
      for iquat = 1:nquat
   
         if sum(ismember(tri(itri ,: ),...
                         q  (iquat,: )))==3
         
               quat_per_tri (itri    ) = iquat; % 1 value per triangle

            if tri_per_quat (iquat   )==0

               tri_per_quat (iquat,1 ) = itri ; % 2 values per quadrangle

            else

               tri_per_quat (iquat,2 ) = itri ; % 2 values per quadrangle

            end
         
         end
      
      end
      
      disp([num2str(100.*itri/ntri),' %']);
   
   end
   
%  Output

   if nargout==1
      OUT.tri_per_quat = tri_per_quat;
      OUT.quat_per_tri = quat_per_tri;
      varargout = {OUT};
   else
      varargout = {tri_per_quat,quat_per_tri};
   end
   
%% EOF   