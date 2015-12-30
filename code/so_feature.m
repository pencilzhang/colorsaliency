function [infomap_SO] = so_feature(temp_img);

k = 1; % scaling factor
sigma = 0.225; %semi-contrast constant
orients = [-45,0,45,90];  %orientations
phase = 0;
numChannel = 8;
numOrient = length(orients);
numPhase = length(phase);
Div = 3.55;
RF_siz = 25;
[~,cfilters] = get_filter_gabor(RF_siz,orients,Div,numChannel,phase);

infomap_SO = cell(length(temp_img),1);
for ss = 1:length(temp_img)
    img = temp_img{ss};
    if max(img(:))>1
        im = double(img)/255;
    else
        im = img;
    end
    imscr = im * 2 -1;
    
    so = computeSO(imscr, cfilters, numChannel, numOrient, numPhase);
    infomap_SO{ss} = csNorm_so(so,k,sigma,numChannel);
end


return
