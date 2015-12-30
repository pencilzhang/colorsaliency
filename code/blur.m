function saliency=blur(s,blurfrac)

if nargin<2
    blurfrac = 0.020;
end
k1 = mygausskernel(size(s,1) * blurfrac , 2 );
k2 = mygausskernel(size(s,2) * blurfrac , 2 );
saliency = myconv2(myconv2(s , k1),k2');

end