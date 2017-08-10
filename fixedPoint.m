function [ xn, itr ,gx,delta, mesg] = fixedPoint( eq, x0, IMax, es )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

xn = [];
x=eval(x0);
xn(1,1)=x;
gx = '';
mesg = '';
itr = 0;
if validate(eq) == 1
equ = formatEqu(eq);
for i=2:IMax
    x=xn(i-1,1);
    xn(i,2)=x;
    xn(i,1) = eval(equ);
    xn(i,3) =abs(xn(i,1)-xn(i,2));
    if xn(i,3) < es
        break
    end
end
itr = i;
gx = equ;
 delta = getError(eq,gx,eval(x0),xn(i,1));
else
  mesg = '%% error in equation %%'; 
end
end

