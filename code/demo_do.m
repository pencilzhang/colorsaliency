function salmap = my_dome_do(img_path,nn)

clear all
clc

addpath('./utils/');
addpath('./mex/');
addpath('./sodoDescriptors/');

img_path = '/Users/junzhang/Documents/Publications/TNNLS/stimuli/13.jpg';
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

[info_DO] = do_feature(multi_img);
salmap = do_saliency(info_DO,grframe,param,[w,h]);
salmap = mat2gray(blur(salmap,param.blurfrac));

return
