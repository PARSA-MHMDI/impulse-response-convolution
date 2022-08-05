function y = myconv(h,x)
% This fuction will compute convolution of a district signal
% Input1: 1*m row vector    Input2: 1*n row vector
% Output: 1*k row vector
% In this code I used matrix method to compute convolution 

% In code below I shaped the matrix
z=[];
for i=1:length(x)
    g=h.*x(i);
    z=[z;g];
end

%Code below computes convolution by useing elements of matrix z
[row colum]=size(z);
k=row+colum;
temper_value=2;
y=[];
cd=0;
while(temper_value<=k)
    for i=1:row
        for j=1:colum
            if((i+j)==temper_value)
               cd=cd+z(i,j);
            end
        end
    end
    temper_value = temper_value + 1;
    y=[y cd];
    cd=0;
end
end