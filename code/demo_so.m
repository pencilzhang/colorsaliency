function salmap = demo_so(img_path)

clear all
clc

addpath('./utils/');
addpath('./mex/');
addpath('./sodoDescriptors/');

img = imread(img_path);
if max(img(:)) > 1
    img = double(img)/255;
else
    img = double(img);
end

[w h n] = size(img);
param = make_Params;
[grframe,param] = gs(param,size(img));

multi_img = cell(4,1);
multi_img{1} = img;

for ii = 2:4
    multi_img{ii} = imresize(multi_img{ii-1},0.6,'bicubic');
end

[info_so] = so_feature(multi_img);%compute SO features with cross-suppression
salmap = so_saliency(info_so,grframe,param,[w,h]); % compute SO saliency
salmap = mat2gray(blur(salmap,param.blurfrac));

return
