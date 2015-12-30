
% this function creates the weight matrix for making edge weights
% and saves some other constants (like node-in-lattice index) to a 'frame'
% used when the graphs are made from saliency/feature maps.

%
% edge types (by default, instantiate fully connected graph. 
%  use inter/intra-type = 1 to connect only to nearest neighbors)
%
% inter_type :
%   1 => only same-location neighbor
%   2 => everywhere inter-scale on consecutive scales
% intra_type :
%   1 => only neighbor
%   2 => everywhere
% cyclic_type :
%   1 => cyclic boundary rules
%   2 => non-cyclic boundaries
%
%  jharel 7 / 27 / 06

function [frame] = graphsalinit( map_size , multilevels , inter_type , intra_type , cyclic_type )
w = map_size(1);
h = map_size(2);
dims = getDims( map_size , multilevels );
[N,nam] = namenodes(dims);
lx = makeLocationMap( dims , nam , N );
for ii=1:w
    for jj = 1:w
        temp_sd(ii,jj) = (ii-jj).^2;
    end
end
sd=zeros(w*h,w*h);
for ii=1:h
    for jj = 1:h
        sd((ii-1)*w+1:ii*w,(jj-1)*w+1:jj*w) = temp_sd + (ii-jj).^2;
    end
end

frame.D = sd;
frame.lx = lx;
frame.dims = dims;
frame.multilevels = multilevels;

% w = salmapsize(1);
% h = salmapsize(2);
% for ii=1:w
%     for jj = 1:w
%         temp_sd(ii,jj) = (ii-jj).^2;
%     end
% end
% sd=zeros(w*h,w*h);
% for ii=1:h
%     for jj = 1:h
%         sd((ii-1)*w+1:ii*w,(jj-1)*w+1:jj*w) = temp_sd + (ii-jj).^2;
%     end
% end

