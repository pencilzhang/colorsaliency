function s = csNorm_so(s,k,sigma,numChannel);

% for jj = 1:numChannel/2
%     S(:,:,jj,:,:) = sqrt(k.* squeeze(s(:,:,jj,:,:)).^2 ./ (sigma.^2 + squeeze(s(:,:,jj+4,:,:)).^2));
% end
% % 
% E = squeeze(sum(s.^2,3))./numChannel;


for jj = 1:numChannel
    s(:,:,jj,:,:) = sqrt(k.* squeeze(s(:,:,jj,:,:)).^2 ./ (sigma.^2 + squeeze(s(:,:,mod(jj+3,8)+1,:,:)).^2));
end

return
