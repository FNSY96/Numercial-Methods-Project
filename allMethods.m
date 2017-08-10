function [xrGeneral,sizeGeneral,msgGeneral,xrBierge,sendOrder,A,B,C ,errorBierge,loopBierge,msgBierge,xrNewton ,FiNewton,f_dev,errorNewton,loopNewton,msgNewton,xrFixedPoint, itrFixedPoint ,gx,xrBisection,itrBisection, xrFalsePosition, itrFalsePosition,xrSecent,FiSecent  ,errorSecent,loopSecent,deltaSecent,msgSecent,msgBisection,msgFixed,msgFalse] = allMethods (inputFilePath,iterations,allowedError)

dataArray = importDataFromFile(inputFilePath);
equ = string(dataArray.textdata(2));
xl = dataArray.data(3);
xu = dataArray.data(4);
x_initial = dataArray.data(5);
x_zero = dataArray.data(6);
now = tic();
[ xrGeneral,sizeGeneral,msgGeneral ] = generalMethod( equ);
time = toc(now);
disp(msgGeneral);
if(isempty(msgGeneral))
    exportTableGeneral('1.1 general method.txt',xrGeneral,sizeGeneral,time);
end
%function [ root_x,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(fun,x_initail,maxIterations, valid_error )
titlesArray = {''};
now = tic();
[ xrBierge,sendOrder,A,B,C ,errorBierge,loopBierge,msgBierge] = Bierge_Vieta(equ,x_initial,iterations, allowedError );
time = toc(now);
if(isempty(msgBierge))
    exportTable("1.2 bierge vieta.txt",xrBierge,titlesArray,size(xrBierge,1),0,time);
end
% function [next_x ,Fi,f_dev,error , loop, delta,mesg] = Newton( fun,x_initail,maxIterations, validError )

% function [next_x ,Fi,f_dev,error , loop, delta,mesg] = Newton( fun,x_initail,maxIterations, validError )
titlesArray = {'roots'};
now = tic();
[xrNewton ,FiNewton,f_dev,errorNewton,loopNewton,deltaNewton,msgNewton] = Newton( equ,x_initial,iterations, allowedError );
time = toc(now);
if(isempty(msgNewton))
    exportTable("1.3 Newton.txt",xrNewton,titlesArray,size(xrNewton,1),deltaNewton,time);
end
% function [ xn, itr ,gx,delta, mesg] = fixedPoint( eq, x0, IMax, es )

titlesArray = {'root','before','error'};
now = tic();
[ xrFixedPoint, itrFixedPoint ,gx,deltaFixed,msgFixed] = fixedPoint( equ, string(x_initial), iterations, allowedError );
time = toc(now);
if(isempty(msgFixed))
    exportTable("1.4 Fixed Point.txt",xrFixedPoint,titlesArray,size(xrFixedPoint,1),deltaFixed,time);
end

titlesArray = {'root','xlower','xupper','error'};
now = tic();
[ xrBisection, itrBisection,msgBisection ] = biSection( equ,string(xl),string(xu),iterations, allowedError );
time = toc(now);
if(isempty(msgBisection))
    exportTable("1.5 Bisection.txt",xrBisection,titlesArray,size(xrBisection,1),0,time);
end
titlesArray = {'root','xlower','xupper','error'};
now = tic();
[ xrFalsePosition, itrFalsePosition,msgFalse ] = falsePosition( equ,string(xl),string(xu),iterations, allowedError );
time = toc(now);
if(isempty(msgFalse))
    exportTable("1.6 False Position.txt",xrFalsePosition,titlesArray,size(xrFalsePosition,1),0,time);
end
% function [next_x,Fi ,error,loop, delta,mesg ] = Secent( fun,x_initail,x_zero,maxIterations, validError )
    titlesArray = {'root'};
now = tic();
[xrSecent,FiSecent ,errorSecent,loopSecent,deltaSecent,msgSecent] = Secent( equ,x_initial,x_zero,iterations, allowedError );
time = toc(now);
if(isempty(msgSecent))
    exportTable("1.7 Secent.txt",xrSecent,titlesArray,size(xrSecent,1),deltaSecent,time);
end


end