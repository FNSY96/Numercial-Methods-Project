function [ root_x,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(fun,x_initail,maxIterations, valid_error )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    syms x;
    mesg='';
    A=[];
    B=[];
    C=[];
    root_x=[];
    sendOrder =[];
    loop=-1;
    error=[];
    if validate(fun) == 1
    try     
    coff=sym2poly(sym(fun));
    i=  feval(symengine, 'degree',sym(fun));
    catch
        mesg ='%% error in equation , equation is not ploynomial %%';
        return ;
    end 
    a=[];
    c=[];
    b=[];
    order=[];
    loop = 1;
    coffCounter=1;
    counter = i+1;
    a(counter)= coff(coffCounter);
    c(counter)= coff(coffCounter);
    b(counter)= coff(coffCounter);
    order(coffCounter)=counter-1;
    iterate =1;
 %   error(iterate)=0;
    xIterate = x_initail;
    root_x(iterate)=x_initail;
    %iterate= iterate+1;
    stop= 1;
    while(  abs(stop) >=0.000000000001 && iterate <= maxIterations  )
        iterate= iterate+1;
        while(counter > 0 )
            counter = counter-1;
            if( counter == 1)
               coffCounter= coffCounter+1;
               order(coffCounter)=counter-1;
               a(counter)= coff(coffCounter);
               b(counter)=a(counter)+ xIterate*b(counter+1);
               root_x(iterate)=xIterate - (b(1)/c(2));
               stop= b(1);
               
               if(iterate == 2)
                   A=fliplr(a)';
                   B =fliplr(b)';
                   C = fliplr(c)';
                   sendOrder = order';
               else
                   A=[A  fliplr(a)'];
                   B =[B fliplr(b)'];
                   C = [C fliplr(c)'];
                   sendOrder =[sendOrder order'];
               end
            elseif (counter >1)
               coffCounter= coffCounter+1;
               order(coffCounter)=counter-1;
               a(counter)= coff(coffCounter);
               b(counter)=a(counter)+ xIterate*b(counter+1);
               c(counter)=b(counter)+ xIterate*c(counter+1);
            end 
           
        end
        stop;
     coffCounter=1;
     counter = i+1;
     a(counter)= coff(coffCounter);
     c(counter)= coff(coffCounter);
     b(counter)= coff(coffCounter);
     order(coffCounter)=counter-1;
     error(iterate)=abs((root_x(iterate) -root_x(iterate-1)));
     xIterate = root_x(iterate);
     %loop = length(order);
     loop= iterate-1;
     
    end
    else   mesg = '%% error in equation %%'; 
end



end

