function [val,numpts]=roundgridfun(varargin)
% ROUNDGRIDFUN grids data using a nearest neighbor gridding technique
%   This function is a very simplistic gridding function which effectively
%   bins the data to find the nearest grid node, then performs the input
%   function on all of the points for each node.
%
%   The grid nodes must be evenly spaced in each dimension.
%
%   The function works for ND datasets (tested up to 5D)
% 
%   1D: [val,numpts]=roundgridfun(x,y,xg,@fun);           % Vector
%   2D: [val,numpts]=roundgridfun(x,y,z,xg,yg,@fun);      % Surface
%   3D: [val,numpts]=roundgridfun(x,y,z,I,xg,yg,zg,@fun); % Voxels   
%
%   The common input functions are @mean, @min, @max, @std, @var
%   The function handle @(x) {x} can be used to return a cell array with
%   all of the data in each grid node bin
% 
% Inputs:
%    - x : nx1 : vector of x values
%    - y : nx1 : vector of y values
%    - z : nx1 : vector of z values (optional)
%    - I : nx1 : vector of I values (optional)
%    - xg: mx1 or array : vector or *array of x grid values
%    - yg: mx1 or array : vector or *array of y grid values (optional)
%    - zg: mx1 or array : vector or *array of z grid values (optional)
%    - fun: @function : handle to a function that
%         *array can be a multidimensional array from meshgrid, but must just
%          vary along one dimension
% 
% Outputs:
%   - val    : values returned from @fun, nan if no points at grid node
%   - numpts : the number of points at each grid node
% 
% Examples:
%     %EXAMPLE 2D 
%     x = rand(1000,1)*10; y = rand(1000,1)*10; z = x.*y;
%     xgi = 0:1:10; ygi = 0:1:10;
%     [val,numpts]=roundgridfun(x,y,z,xgi,ygi,@min); % Minimum Z Surface
%     figure; pcolor(xgi,ygi,val);
% 
% Dependencies:
%   - n/a
% 
% Toolboxes Required:
%   - n/a
% 
% Author        : Richie Slocum    
% Email         : richie@cormorantanalytics.com    
% Date Created  : 22-Jan-2016    
% Date Modified : 22-Jan-2016    

%% Check to make sure the last input is a valid function
fun = varargin{end};
try
    foo = fun([1 2 3]); %test if the function works
catch
    error('Last User Input is not a valid function');
end

%% Check that Number of inputs is 4:2:inf 4=1D, 6=2D, 8=3D, ...etc
% future code could expand to more dimensions if need be
isGoodNumInputs = mod(nargin,2)==0 && nargin>=4;
if ~isGoodNumInputs
    error('Unknown number of inputs');
end

%% populate X with raw data in a double array (MxN)
%    M = number of elements
%    N = number of dimensions
X = populateX(varargin);

%% populate Xg with gridded data in a structure {(N-1),1}(P)
%    N-1 = number of dimensions minus 1, because last one is being gridded
%    P = number of bins in each dimension
Xg = populateXg(varargin);

%% Filter X values to throw out bad points outside of Xg range for each
Xfilt = filterXoutliers(X,Xg);
I = Xfilt(:,end);

%% Interpolate to Index Values
Xind = calcInds(Xfilt,Xg);

%% Calculate Accumarray
sizeXg = calcSize(Xg);
N = numel(sizeXg);
% squeeze and permute to flip so Z,Y,X to be X,Y,Z
val = squeeze(permute(accumarray(Xind, I, sizeXg,fun,fun(nan)),N:-1:1));
%% Output Number Of Points if user requests more than one output
if nargout==2
    numpts = squeeze(permute(accumarray(Xind, 1, sizeXg,@sum),N:-1:1));
else
    numpts=[];
end
end
function X = populateX(rawUserInputs)
% Assembles matrix X, which contains all the data from the first half
% of the elements in rawUserInputs
% Also checks to make sure the variables are the same length
numX = numel(rawUserInputs)/2;
numXval = numel(rawUserInputs{1});
X = nan(numXval,numX);
for iX = 1:numX
    %check variable
    if numel(rawUserInputs{iX})~=numXval
        error('numel(varargin(1))~=numel(varargin{%.0f}',iX);
    end
    X(:,iX)=rawUserInputs{iX}(:);
end
%% Remove nans from gridding variables
ind = logical(sum(isnan(X(:,1:end-1)),2));
X(ind,:)=[];
end

function Xg = populateXg(rawUserInputs)
% Assembles matrix Xg, which contains each of the vectors or arrays which
% the data will be gridded to
% Also checks to make sure the variables are the same length
numXg = numel(rawUserInputs)/2-1;
firstXgInd = numel(rawUserInputs)/2+1;
Xg = cell(1,numXg);
iCount = 0;
for iXg = firstXgInd:firstXgInd+numXg-1
    iCount = iCount +1;
    [m,n]=size(rawUserInputs{iXg});
    if m>1 && n>1%If Xg variables are more than 1D
        XgArray = rawUserInputs{iXg};
        Xg{iCount} = calcVectorFromArray(XgArray);
    else
        Xg{iCount} = rawUserInputs{iXg};
    end
end
end

function Xfilt = filterXoutliers(X,Xg)
% Filters X matrix to remove outliers that are beyond the region we will be
% gridding to.
[~,n]=size(Xg);
Xfilt = X;
for iDim=1:n
    dx = mean(diff(Xg{iDim}));
    lowXg = Xg{iDim}(1);
    highXg = Xg{iDim}(end);
    badind = Xfilt(:,iDim)<lowXg-dx/2 | Xfilt(:,iDim)>=highXg+dx/2;
    Xfilt(badind,:)=[];
end

end

function XgVector = calcVectorFromArray(XgArray)
%Convert a user input array into the vector that describes that dimension
% ie if use inputs [1 2 3; 1 2 3; 1 2 3], output is just [1,2,3];  The code
% look for the first dimension with changing values
N = ndims(XgArray);
for iDim = 1:N
    inds = repmat({1},1,N);%{1,1,1,...,1}
    inds{iDim} = 1:size(XgArray,iDim);%{1,1,1:x,...,1}
    XgVector = squeeze(XgArray(inds{:})); %becomes values along 1:x in iDim
    dX = mean(diff(XgVector));
    if dX~=0
        break %jump out of the loop, weve found the changing dimension
    elseif iDim==N
        error('No changing dimension found');
    end
end
XgVector = XgVector(:);
end

function Xind = calcInds(Xfilt,Xg)
% The Index values for each X points are calculated for the corresponding
% grid vectors along each dimension.
[~,n]=size(Xg);
Xind = Xfilt(:,1:end-1);
for iDim=1:n
    Xind(:,iDim) = interp1(Xg{iDim},1:numel(Xg{iDim}),Xfilt(:,iDim),'nearest','extrap');
end
end

function sizeXg = calcSize(Xg)
% The output size of xg is calculated for the Xg cell.
nDims = numel(Xg);

sizeXg = nan(1,nDims);
for iDim=1:nDims
    sizeXg(iDim) = numel(Xg{iDim});
end
if nDims ==1
    sizeXg(2)=1;
end
end