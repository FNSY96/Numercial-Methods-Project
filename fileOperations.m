function [methodName,time,mesg,answer,errors,rootsGauss,rootsJordan,rootsLU,rootsSeidel,errorsSeidel]  = fileOperations (inputFilePath, outputFilePath)
if (strcmpi(outputFilePath,'null'))
    outputFilePath = 'results of mult-equ.txt';
end
maxIterations = 50;
epsilon = 0.00001;
dataArray = importDataFromFile(inputFilePath);
methodName = dataArray.textdata(1);
fid = fopen(inputFilePath);
string(fgets(fid));
[coeffs, mesg] = getCoefficent(fgets(fid));
afterEqualSign = seperateComma(fgets(fid));
if (strcmpi(methodName,'gauss seidel') || strcmpi(methodName,'all'))
    initalMatrix = seperateComma(fgets(fid));
    maxIterationsCarry = str2double(fgets(fid));
    epsilonCarry = str2double(fgets(fid));
end
fclose(fid);
if(~isempty(mesg))
    return;
end
if(strcmpi(methodName,'gauss'))
    
    now1 = tic();
    [answer] =  Gauss(coeffs,afterEqualSign);
    time = toc(now1);
    extraData = strcat('time:\t',string(time),' seconds');
    errors=0;
    rootsGauss=0;
    rootsJordan=0;
    rootsLU=0;
    rootsSeidel=0;
    errorsSeidel=0;
elseif (strcmpi(methodName,'gauss jordan'))
    now1 = tic();
    [answer] =  Gauss_Jordan(coeffs,afterEqualSign);
    time = toc(now1);
    extraData = strcat('time:\t',string(time),' seconds');
    errors=0;
    rootsGauss=0;
    rootsJordan=0;
    rootsLU=0;
    rootsSeidel=0;
    errorsSeidel=0;
elseif (strcmpi(methodName,'LU decomposition'))
    now1 = tic();
    [answer] =  LU_Decomposition(coeffs,afterEqualSign);
    time = toc(now1);
    extraData = strcat('time:\t',string(time),' seconds');
    errors=0;
    rootsGauss=0;
    rootsJordan=0;
    rootsLU=0;
    rootsSeidel=0;
    errorsSeidel=0;
elseif (strcmpi(methodName,'gauss seidel'))
    if(maxIterationsCarry > 0)
        maxIterations =   maxIterationsCarry;
    end
    if (epsilonCarry > 0)
        epsilon = epsilonCarry;
    end
    now1 = tic();
    
    %     function [ rootsMatrix,errors ] = GaussSeidel( coffMatrix,answerMatrix,initalMatrix,maxIterations,epsilon )
    
    [ answer,errors ] = GaussSeidel( coeffs,afterEqualSign,initalMatrix,(maxIterations),(epsilon) );
    time = toc(now1);
    extraData = strcat('time:\t',string(time),'seconds','\nnumber of iterations:\t',string(size(answer,2)));
    exportGaussSeidel(outputFilePath,answer,extraData,errors);
    rootsGauss=0;
    rootsJordan=0;
    rootsLU=0;
    rootsSeidel=0;
    errorsSeidel=0;
    return;
elseif (strcmpi(methodName,'all'))
    if(maxIterationsCarry > 0)
        maxIterations =   maxIterationsCarry;
    end
    if (epsilonCarry > 0)
        epsilon = epsilonCarry;
    end
    [rootsGauss,rootsJordan,rootsLU,rootsSeidel,errorsSeidel] = allMethodsMultiple  ( coeffs,afterEqualSign,initalMatrix,maxIterations,epsilon );
    errors=0;
    answer=0;
    time = 0;
    return;
end
exportTableLinearEqu(outputFilePath,answer,extraData);
end



% while ischar(tline)
%     disp(tline)
%     tline = fgets(fid);
% end