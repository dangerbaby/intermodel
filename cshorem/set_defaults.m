function [in2]=set_defaults(in)
in2 = in;
for kk = 1:length(in) % loop over in
  if ~isfield(in(kk),'iprofl')|isempty(in(kk).iprofl);in2(kk).iprofl = 0;end
  if ~isfield(in(kk),'iroll')|isempty(in(kk).iroll);in2(kk).iroll = 0;end
  if ~isfield(in(kk),'rollerbeta')|isempty(in(kk).rollerbeta);in2(kk).rollerbeta = .1;end
  if ~isfield(in(kk),'cf');in2(kk).cf = in(kk).fw./2;end
  if ~isfield(in(kk),'A0')|isempty(in(kk).A0);in2(kk).A0 = 4.5;end
  if ~isfield(in(kk),'rwh');in2(kk).rwh = .01;end
  if ~isfield(in(kk),'zbhard')|isempty(in(kk).zbhard);in2(kk).zbhard = in(kk).zb-100;end
  if ~isfield(in(kk),'verbose');in2(kk).verbose = 1;end
  if length(in2(kk).cf)==1;in2(kk).cf=in2(kk).cf*ones(size(in(kk).x));end
end