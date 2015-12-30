function saliency = fuse_saliency(act_maps,str)

numChannel = size(act_maps,3);

for jj=1:numChannel/2
    temp_saliency(:,:,jj,:,:) = max(act_maps(:,:,jj,:,:),act_maps(:,:,jj+numChannel/2,:,:));
end
c_saliency = squeeze(sum(temp_saliency,3));
e_saliency = squeeze(sum(c_saliency,3));
saliency = squeeze(sum(e_saliency,3));

end