function [rootsGauss,rootsJordan,rootsLU,rootsSeidel,errorsSeidel] = allMethodsMultiple (coeffs,afterEqualSign,initalMatrix,maxIterations,epsilon )
now1 = tic();
rootsGauss = Gauss(coeffs,afterEqualSign);
extraData = toc(now1);
extraData = strcat('time:\t',string(extraData),' seconds');
exportTableLinearEqu('2.1 gauss.txt',rootsGauss,extraData);

now1 = tic();
rootsJordan = Gauss_Jordan(coeffs,afterEqualSign);
extraData = toc(now1);
extraData = strcat('time:\t',string(extraData),' seconds');
exportTableLinearEqu('2.2 gauss jordan.txt',rootsJordan,extraData);

now1 = tic();
rootsLU = LU_Decomposition(coeffs,afterEqualSign);
extraData = toc(now1);
extraData = strcat('time:\t',string(extraData),' seconds');
exportTableLinearEqu('2.3 LU Decomposition.txt',rootsLU,extraData);

now1 = tic();
[rootsSeidel,errorsSeidel] = GaussSeidel (coeffs,afterEqualSign,initalMatrix,(maxIterations),(epsilon ));
extraData = toc(now1);
extraData = strcat('time:\t',string(extraData),' seconds','\nnumber of iterations:\t',string(size(rootsSeidel,2)));
exportGaussSeidel('2.4 GaussSeidel.txt',rootsSeidel,extraData,errorsSeidel);
return;
end