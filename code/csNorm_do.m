function s = csNorm_do(s,k,sigma,numOrient);
% 

for jj = 1:numOrient
    s(:,:,:,jj,:) = sqrt(k.* squeeze(s(:,:,:,jj,:)).^2 ./ (sigma.^2 + squeeze(s(:,:,:,mod(jj+1,4)+1,:)).^2));
end
return