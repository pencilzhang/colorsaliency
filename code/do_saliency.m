function edge_saliency = do_saliency(info_DO,grframe,param,map_size)

DO_feature = compute_act(info_DO,grframe,param);
edge_saliency = fuse_saliency(DO_feature,'edge');
edge_saliency = imresize(edge_saliency,map_size,'bicubic');

end