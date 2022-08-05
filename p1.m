function mydet = p1(mat)
%This function computes matrix determinant
%Determinant formula: for matirx A = [a b;c d] det= ad-bc 
%   input: 2*2 matrix
%   output: 1*1 vector
mydet = ((mat(1,1) .* mat(end,end)) - (mat(1,end) .* mat(end,1)));
end