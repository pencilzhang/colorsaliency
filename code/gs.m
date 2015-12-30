function [grframe,param] = gs(param, imgsize)

w = imgsize(2); h = imgsize(1); scale = param.salmapmaxsize / max(w,h);
salmapsize = round( [ h w ] * scale );
grframe = graphsalinit( salmapsize , param.multilevels , 2, 2, param.cyclic_type);
param.salmapsize = salmapsize;
return
