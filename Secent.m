function [next_x,Fi ,error,loop, delta ,mesg] = Secent( fun,x_initail,x_zero,maxIterations, validError )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
      next_x =[]; 
      error =[];
      Fi=[];
      syms x;
      mesg='';
      delta=-1;
      loop=-1;
      if validate(fun) == 1
      f(x)=eval(fun);
      x=x_zero;
      try 
           fx_zero=subs(f(x));
      catch
          return ;
      end 
     
      x=x_initail;
      try
      fx_i=subs(f(x));
      catch
          return ;
      end 
      Fi(1)=fx_i;
      numerator = fx_i*(x_initail -x_zero);
      denominator= fx_i-fx_zero;
      xi=x_initail -(numerator/denominator);
      errorI =abs((xi-x));
      error(1)=errorI;
      next_x(1)=xi;
      counter=1;
      loop=1;
  while( errorI> validError && counter < maxIterations )
      if (counter == 1)
          x=x_initail;       %x(i-1)
          try
               fx_zero=subs(f(x)); 
          catch
              return ;
          end
            
          x=next_x(counter);
          try
             fx_i=subs(f(x));
          catch 
              return ;
          end 

          Fi(counter+1)=fx_i;
          numerator = fx_i*(xi - x_initail); %x(i-1)
          denominator= fx_i-fx_zero; 
          xi=xi -(numerator/denominator);
          errorI =abs((xi-x));
          counter= counter+1;
          error(counter)=errorI;
          next_x(counter)=xi;
          loop= length(next_x);
      elseif  counter ~= 1
           x=next_x(counter -1);       %x(i-1)
           try
            fx_zero=subs(f(x));  
           catch
           return ;
           end
           
            
          x=next_x(counter);
          try 
              fx_i=subs(f(x));
          catch
              return;
          end 
          
          Fi(counter+1)=fx_i;
          numerator = fx_i*(xi -next_x(counter -1)); %x(i-1)
          denominator= fx_i-fx_zero; 
          xi=xi -(numerator/denominator);
          errorI =abs((xi-x));
          counter= counter+1;
          error(counter)=errorI;
          next_x(counter)=xi;
          loop= length(next_x);
      end
      
  end
  
    
  delta= 0;
  else   mesg = '%% error in equation %%'; 
end

end

