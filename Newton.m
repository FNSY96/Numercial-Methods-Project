function [next_x ,Fi,f_dev,error , loop, delta,mesg] = Newton( fun,x_initail,maxIterations, validError )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
      next_x =[]; 
      error =[];
      Fi=[];
      f_dev=[];
      mesg='';
      loop=-1;
      delta=-1;
      syms x;
      if validate(fun) == 1
      f(x)=eval(fun);
      df=diff(f,x);
      secoondDerivative = diff(df,x);
      x=x_initail;
      try 
           numerator=subs(f(x));
      denominator= subs(df);
      catch
        return ;  
      end      
     
      xi= x_initail -(numerator/denominator);
      next_x(1)=xi;
      errorI =abs(xi-x);
      error(1)=errorI;
      counter=1;
      loop = 1;
  while( errorI> validError && counter < maxIterations)
      x=next_x(counter);
      try
       numerator=subs(f(x));     
      denominator= subs(df); 
      catch
      return ;
      end 
        
      Fi(counter)=numerator;
      f_dev(counter)=denominator;
      xi= x -(numerator/denominator);
      errorI =abs(xi-x);
      counter=counter+1;
      next_x(counter)=xi;
      error(counter)=errorI;
  end
      x=next_x(counter);
      try    
       numerator=subs(f(x));     
      denominator= subs(df); 
      catch
          return ;
      end 
     
      Fi(counter)=numerator;
      f_dev(counter)=denominator;
      loop = length(next_x);
      next_x=[ x_initail,next_x];
      error=[ 1 ,error];
      syms x;
      alpha= fzero(matlabFunction(f(x)),x_initail);  
      x=alpha; 
      next_x(counter);
      prevDelta = alpha-next_x(counter);
      try
          
      q = abs((- subs(secoondDerivative)*abs(prevDelta)^2)/(2*subs(df)));
      catch 
          q=0;
      end 
      %q = abs((- subs(secoondDerivative)*abs(prevDelta)^2)/(2*subs(df)));
   delta= eval(q);
      else   mesg = '%% error in equation %%'; 
end  
end

