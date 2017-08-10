function [ xr, itr, mesg] = falsePosition( equ,x1,x2,IMax, es )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xr=[];
itr = 0;
mesg = '';
if validate(equ) == 1
xl = eval(x1);
xu = eval(x2);
    x=xl;
    fl=eval(equ);
    x=xu;
    fu=eval(equ);
    if(fl*fu)>0
      mesg = '%%error in xl and xu%%';
        return;
    end
    for i=1:IMax
        xr(i,2) = xl;
        xr(i,3) = xu;
        xr(i,1)= ((xl*fu)-(xu*fl))/(fu-fl);
        x=xr(i,1);
        fr=eval(equ);
        if fr == 0
            break;
        end
        if(fr*fl)<0
            xu=xr(i,1);
            x=xu;
            fu=eval(equ);
        else 
            xl=xr(i,1);
            x=xl;
            fl=eval(equ); 
        end
        if i>1
          xr(i,4) = abs(xr(i,1)-xr(i-1,1));
        end
        if i>1 && xr(i,4)<es
            break
        end
    end
    itr = i;
   
else
    mesg = '%% error in equation %%';
end
end

