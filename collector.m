function  [name,error,time,delta,equationString,mesg,xr,iterations,allowedError,xl,xu,size1,x_initial,x_zero,A,B,C,sendOrder,Fi,gx,f_dev,xrGeneral,sizeGeneral,msgGeneral,xrBierge,sendOrderAll,A_all,B_all,C_all ,errorBierge,loopBierge,msgBierge,xrNewton ,FiNewton,f_dev_all,errorNewton,loopNewton,msgNewton,xrFixedPoint, itrFixedPoint ,gx_all,xrBisection,itrBisection, xrFalsePosition, itrFalsePosition,xrSecent,FiSecent  ,errorSecent,loopSecent,deltaSecent,msgSecent,msgBisection,msgFixed,msgFalse] =  collector(inputFilePath, outputFilePath)

if (strcmpi(outputFilePath,'null'))
    outputFilePath = 'result.txt';
     name ='';
     mesg='';
     xr=0;
     error=0;
    xl = 0;
    xu = 0;
    size1 = 0;
    x_initial = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    delta = 0;
end
dataArray = importDataFromFile(inputFilePath);
equationString = string(dataArray.textdata(2));
iterations = 50;
allowedError = 0.00001;
if(strcmpi(dataArray.textdata(1),'bisection'))
    % function [ xr, itr,mesg] = biSection( equ,x1,x2,IMax, es )
    if(dataArray.data(3) > 0)
        iterations =   dataArray.data(3);
    end
    
    if (dataArray.data(4) > 0)
        allowedError = dataArray.data(4);
    end
    titlesArray = {'root','xlower','xupper','error'};
    now1 = tic();
    [ xr, itr ,mesg] = biSection(string(dataArray.textdata(2)),string(dataArray.data(1)),string(dataArray.data(2)),iterations,allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    name ='Bisection';
    xl = dataArray.data(1);
    xu = dataArray.data(2);
    iterations = itr;
    size1 = 0;
    x_initial = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    error=0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
elseif (strcmpi(dataArray.textdata(1),'false position'))
    %     function [ xr, itr, mesg] = falsePosition( equ,x1,x2,IMax, es )
    
    if(dataArray.data(3) > 0)
        iterations =   dataArray.data(3);
    end
    if (dataArray.data(4) > 0)
        allowedError = dataArray.data(4);
    end
    titlesArray = {'root','xlower','xupper','error'};
    now1 = tic();
    
    [ xr, itr, mesg] = falsePosition(string(dataArray.textdata(2)),string(dataArray.data(1)),string(dataArray.data(2)),iterations, allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    name ='false position';
    xl = dataArray.data(1);
    xu = dataArray.data(2);
      iterations = itr;
    size1 = 0;
    x_initial = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    error=0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
elseif (strcmpi(dataArray.textdata(1),'fixed point'))
%     function [ xn, itr ,gx,delta, mesg] = fixedPoint( eq, x0, IMax, es )
    % function [ xn, itr ,gx, mesg] = fixedPoint( eq, x0, IMax, es )
    if(dataArray.data(2) > 0)
        iterations =   dataArray.data(2);
    end
    if (dataArray.data(3) > 0 )
        allowedError = dataArray.data(3);
    end
    titlesArray = {'root','before','error'};

    now1 = tic();
    [ xr, itr ,gx,delta,mesg] = fixedPoint( string(dataArray.textdata(2)),string(dataArray.data(1)),iterations,allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    name ='fixed point';
    x_initial = dataArray.data(1);
      iterations = itr;
    size1 = 0;
    xl = 0;
    xu = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    error=0;
    sendOrder=0;
    Fi = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    
elseif (strcmpi(dataArray.textdata(1),'newton'))
    %function [next_x ,Fi,f_dev,error] = Newton( fun,x_initail,maxIterations, validError )
    % function [next_x ,Fi,f_dev,error , loop, delta,mesg] = Newton( fun,x_initail,maxIterations, validError )
    
    if(dataArray.data(2) > 0)
        iterations =   dataArray.data(2);
    end
    if (dataArray.data(3) > 0 )
        allowedError = dataArray.data(3);
    end
    titlesArray = {'roots'};
    now1 = tic();
    
    [xr ,Fi,f_dev,error , loop, delta,mesg] = Newton(string(dataArray.textdata(2)),dataArray.data(1),iterations,allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    name ='newton';
    x_initial = dataArray.data(1);
      iterations = loop;
    size1 = 0;
    xl = 0;
    xu = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    
elseif (strcmpi(dataArray.textdata(1),'secent'))
    %function [next_x,Fi ,error] = Secent( fun,x_initail,x_zero,maxIterations, validError )
    % function [next_x,Fi ,error,loop, delta,mesg ] = Secent( fun,x_initail,x_zero,maxIterations, validError )
    
    if(dataArray.data(3) > 0)
        iterations =   dataArray.data(3);
    end
    if (dataArray.data(4) > 0 )
        allowedError = dataArray.data(4);
    end
    titlesArray = {'root'};
    now1 = tic();
    
    [xr,Fi ,error,loop, delta,mesg ] = Secent  (string(dataArray.textdata(2)),dataArray.data(1),dataArray.data(2),iterations,allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    name ='secent';
    x_initial = dataArray.data(1);
    x_zero = dataArray.data(2);
    iterations = loop;
    size1 = 0;
    xl = 0;
    xu = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    
elseif (strcmpi(dataArray.textdata(1),'bierge vieta'))
    %function [ root_x,sendOrder,A,B,C ,error] = Bierge_Vieta(fun,x_initail,maxIterations, valid_error )
    %function [ root_x,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(fun,x_initail,maxIterations, valid_error )
    
    if(dataArray.data(2) > 0)
        iterations =   dataArray.data(2);
    end
    if (dataArray.data(3) > 0 )
        allowedError = dataArray.data(3);
    end
    titlesArray = {''};
    now1 = tic();
    
    [ xr,sendOrder,A,B,C ,error , loop,mesg] = Bierge_Vieta(string(dataArray.textdata(2)),dataArray.data(1),iterations,allowedError);
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    
    name ='bierge vieta';
    x_initial = dataArray.data(1);
    iterations = loop;
    size1 = 0;
    xl = 0;
    xu = 0;
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    
elseif(strcmpi(dataArray.textdata(1),'general'))
    % function [ roots , size, mesg] = generalMethod( equ )
    
    now1 = tic();
    [ xr, size1,mesg ] = generalMethod(string(dataArray.textdata(2)));
    time = toc(now1);
    if(~isempty(mesg))
        return;
    end
    exportTableGeneral(outputFilePath,xr,size1,time);
    name ='general';
    x_initial = 0;
    xl = 0;
    xu = 0;
    error=0
    x_zero = 0;
    A = 0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    xrGeneral = 0;
    sizeGeneral = 0;
    msgGeneral = 0;
    xrBierge = 0;
    sendOrderAll = 0;
    A_all = 0;
    B_all = 0;
    C_all  =0;
    errorBierge = 0;
    loopBierge = 0;
    msgBierge = 0;
    xrNewton = 0;
    FiNewton = 0;
    f_dev_all = 0;
    errorNewton = 0;
    loopNewton = 0;
    msgNewton = 0;
    xrFixedPoint = 0;
    itrFixedPoint = 0;
    gx_all = 0;
    xrBisection =0;
    itrBisection = 0;
    xrFalsePosition = 0;
    itrFalsePosition = 0;
    xrSecent = 0;
    FiSecent = 0;
    errorSecent = 0;
    loopSecent = 0;
    deltaSecent = 0;
    msgSecent = 0;
    msgBisection = 0;
    msgFixed = 0;
    msgFalse = 0;
    return;

elseif(strcmpi(dataArray.textdata(1),'all'))
    if(dataArray.data(1) > 0)
        iterations =   dataArray.data(1);
    end
    if (dataArray.data(2) > 0)
        allowedError = dataArray.data(2);
    end
    [xrGeneral,sizeGeneral,msgGeneral,xrBierge,sendOrderAll,A_all,B_all,C_all ,errorBierge,loopBierge,msgBierge,xrNewton ,FiNewton,f_dev_all,errorNewton,loopNewton,msgNewton,xrFixedPoint, itrFixedPoint ,gx_all,xrBisection,itrBisection, xrFalsePosition, itrFalsePosition,xrSecent,FiSecent  ,errorSecent,loopSecent,deltaSecent,msgSecent,msgBisection,msgFixed,msgFalse] =   allMethods (inputFilePath,iterations,allowedError);
    name = 'all';
    size1 = 0;
    xl=0;
    xu=0;
    xr=0;
    time = 0;
    iterations=0;
    allowedError=0;
    x_initial = 0;
    x_zero = 0;
    A = 0;
    error=0;
    B = 0;
    C = 0;
    sendOrder=0;
    Fi = 0;
    gx = 0;
    f_dev = 0;
    
    return;
end
if (strcmpi(name,'secent')|| strcmpi(name,'newton') || strcmpi(name,'bierge vieta'))
    exportTable(outputFilePath,xr,titlesArray,size(xr,2),delta,time);
else
exportTable(outputFilePath,xr,titlesArray,size(xr,1),delta,time);
end

%function exportTable(directory,matrix,significantDigitsBeforePoint,significantDigitsAfterPoint)












