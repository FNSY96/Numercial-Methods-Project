function [ roots , size, mesg] = generalMethod( equ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%intv = 0.5;
nOfintv = 200/.5; %-100 : 100
addIntv = -100;
roots = [];
indx = 1;
size = 0;
mesg = '';
if validate(equ) == 1
for i=1:nOfintv
    lower = addIntv+0.001;
    upper = addIntv+0.5;
    addIntv = upper;
    [a,b,m] = biSection(equ,num2str(lower),num2str(upper),50,0.00001);
    if(b ~= 0 && ~isnan(a(b)))
    roots(:,:,:,indx) = a;
    indx = indx + 1;
    end
end
size = indx - 1;
else
    mesg = '%%%not valid equation %%';
end

end

