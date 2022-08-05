function invmat = p2(mat)
%This function will invert inputed matrix
% 2*2 matrix invert formula: For input mat = [a b;c d] the output is: (1/det(mat)).*([d -b;-c a])
%   input: 2*2 matrix   output: 2*2 matrix

det_mat = p1(mat);

if det_mat == 0
    disp("This matirx is not invertible")

else
    invmat = (1/p1(mat)).*([mat(end,end) ((-1).*mat(1,end)) ; ((-1).*mat(end,1)) mat(1,1)]);
end


end