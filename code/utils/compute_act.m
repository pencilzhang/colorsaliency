function active_map = compute_act(SS,grframe,param)

for typei = 1 :length(SS)
    for ii = 1:size(SS{typei},3)
        for jj = 1:size(SS{typei},4)
            active_map(:,:,ii,jj,typei) = kai_alapply( squeeze(SS{typei}(:,:,ii,jj)) , ...
                grframe, param.sigma_frac_act ,param);
        end
    end
end
end