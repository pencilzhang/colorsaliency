function color_saliency = so_saliency(info_so,grframe,param,map_size)

so = compute_act(info_so,grframe,param);
color_saliency = fuse_saliency(so,'color');
color_saliency = imresize(color_saliency,map_size,'bicubic');
end