function kai_s = kai_norm(s)
k_dims = size(s,3);
for ii=1:k_dims
    temp_s = s(:,:,ii);
    kai_std = std(temp_s(:));
    if kai_std ~= 0
        kai_s(:,:,ii) = (temp_s-mean(temp_s(:)))/kai_std;
    else
        kai_s(:,:,ii)=temp_s;
    end
end