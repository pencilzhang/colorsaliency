

function Anorm = graphsalapply( A , frame , sigma_frac, num_iters , algtype , tol )

lx = frame.lx;
Apyr =  A;
P = size(lx,1);
dims = frame.dims;
k_s = [size(A,1) size(A,2)];
sig = sigma_frac * mean(k_s);
Dw = exp(-1*frame.D/(2 * sig^2));
temp_MM = zeros(P,P,size(Apyr,3));
temp_PMM  = zeros(P,P);
MM = zeros( P , P );
for ii = 1:size(Apyr,3)
    temp_Apyr = mat2gray(Apyr(:,:,ii));
    temp_AL = temp_Apyr(:);
    mexAssignWeights( temp_AL, Dw, temp_PMM, algtype);
    temp_MM(:,:,ii) = temp_PMM;
end
% MM = max(temp_MM,[],3);
MM = sum(temp_MM,3);
MM = MM+MM';
MM = MM./repmat(sum(MM),[size(MM,1),1]);
[AL,iteri] = principalEigenvectorRaw(MM ,tol);
iters = iteri;
if num_iters>1
    for i=1:num_iters-1
        mexAssignWeights( AL, Dw, MM, algtype);
        MM = MM+MM';
        MM = MM./repmat(sum(MM),[size(MM,1),1]);
        [AL,iteri] = principalEigenvectorRaw(MM ,tol);
        iters = iters + iteri;
    end
end
% [E, D] = eig(MM);
% E = real(E);
% kkk=(E(1,:));
% collapse multiresolution representation back onto one scale
Vo = mexSumOverScales( AL , lx , prod([size(A,1) size(A,2)]) );

% arrange the nodes back into a rectangular map
Anorm = reshape(Vo,[size(A,1) size(A,2)]);
