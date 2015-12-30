function Anorm = kai_alapply( A , frame , sigma_frac,param)
algtype =param.algtype;
lx = frame.lx;
Apyr =  imresize(A, param.salmapsize);
Apyr = kai_norm(Apyr);
P = size(lx,1);
dims = frame.dims;
k_s = [size(A,1) size(A,2)];
sig = sigma_frac * mean(k_s);
Dw = exp(-1*frame.D/(2 * sig^2));
MM = zeros( P , P );
iters = 1;
for ii = 1:iters
    temp_AL = Apyr(:);
    mexAssignWeights( temp_AL, Dw, MM, algtype);
end
% MM = max(temp_MM,[],3);
% MM = sum(temp_MM,3);
% MM = MM+MM';
% MM =1 - exp(-MM);
% MM = MM./repmat(sum(MM),[size(MM,1),1]);
AL = sum(MM,2);
Vo = mexSumOverScales( AL , lx , prod(param.salmapsize));
Anorm = reshape(Vo,param.salmapsize);
% Anorm = imresize(Anorm,size(A));
