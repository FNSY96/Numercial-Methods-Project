function [ rootsMatrix,errors ] = GaussSeidel( coffMatrix,answerMatrix,initalMatrix,maxIterations,epsilon )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
  % assume there is no piovting 
  dimension = size(coffMatrix,1);
  digonal= 1;
  rootsMatrix=[];
  errors=[];
  checkSecondConditon=0;  
  % check the first  condition of convergence
  for digonal= 1 : dimension
      dominant = abs(coffMatrix(digonal,digonal));
      dominantCounter= 1;
      sum=0;
      while( dominantCounter <= dimension)      
          if(dominantCounter ~=  digonal)
              sum = sum+abs(coffMatrix(digonal,dominantCounter));
              dominantCounter = dominantCounter+1;
          else
             
              dominantCounter = dominantCounter+1;
              
          end 
      end 
      if( dominant< sum)
          
           disp('%% it will diverge  %%')
           return;
      elseif (dominant > sum)
         checkSecondConditon=checkSecondConditon+1;        
      end
     
      
  end
  
   % check the second  condition of convergence
    if ( checkSecondConditon == 0)
         disp('%%  it will diverge  %%')
           return;
    end
    
    maxError=100;
    iterate=1;
     calculatedRoots=[]; 
     prevCalculatedRoots=[];
     prevCalculatedRoots = initalMatrix; 
     errorColum=[];
     while( iterate <= maxIterations && maxError > epsilon)
         % start iteration 
             for (digonal= 1 : dimension)
                 numerator= answerMatrix( digonal);
                 counter=1;
                 % calcolate numerator for the  current  variable
                 while( counter<=dimension)
                     if( counter > digonal)
                      numerator=numerator-coffMatrix(digonal,counter)*prevCalculatedRoots(counter);
                      counter= counter+1; 
                     elseif(counter < digonal)
                         numerator=numerator-coffMatrix(digonal,counter)*calculatedRoots(counter);
                         counter= counter+1;
                     else
                         counter= counter+1;
                     end
                     
                 end
                % end calcolating numerator for the  current  variable
                calculatedRoots(digonal)= numerator / coffMatrix(digonal,digonal);
                errorColum(digonal)= abs(calculatedRoots(digonal)-prevCalculatedRoots(digonal));
                 
             end
         maxError= max(errorColum);
         prevCalculatedRoots= calculatedRoots;
         if ( iterate==1)
         rootsMatrix = calculatedRoots';
         errors=errorColum';
         else
         rootsMatrix =[rootsMatrix  calculatedRoots'];
         errors=[ errors errorColum'];
         end
         
         iterate= iterate+1;
         
        
     end 
   
   
   
   
   
   
  
end

