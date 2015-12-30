function [infomap_DO] = do_feature(temp_img);

w = size(temp_img{1},2); h = size(temp_img{1},1);
k = 1; % scaling factor
sigma = 0.225; %semi-contrast constant
orients = [-45,0,45,90];  %orientations
phase = 0;
numChannel = 8;
numOrient = length(orients);
numPhase = length(phase);
Div = 3.55;
RF_siz = 25;
[gfilters,cfilters] = get_filter_gabor(RF_siz,orients,Div,numChannel,phase);

infomap_DO = cell(length(temp_img),1);
for ss=1:length(temp_img)
    
    im = temp_img{ss};
    imscr = im * 2 -1;
    
    sofeat = computeSO(imscr, cfilters, numChannel, numOrient, numPhase);
    sofeat = csNorm_do(sofeat,k,sigma,numOrient);
    infomap_DO{ss} = computeDO(sofeat,gfilters,numChannel,numOrient,numPhase);
    
end

return
