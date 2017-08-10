function[answer] = Gauss_Jordan(inputArray,answer)
% anyArray = [3,-0.1,-0.2;0.1,7,-0.3;0.3,-0.2,10];
dimension = size(inputArray,1);
gaussMatrix = reshape(inputArray,[dimension,dimension]);
[gaussMatrix,answer] = removeLowerTriangle (gaussMatrix,answer,dimension);
row = 1;
for diagonal = 1 : dimension
    pivot = 1/gaussMatrix(diagonal,diagonal);
    gaussMatrix(row,:) =  times(pivot, gaussMatrix(row,:));
    answer(row) =  times(pivot,answer(row));
    row = row + 1;
end
gaussMatrix = flipud(fliplr(gaussMatrix));
answer = fliplr(answer);
[gaussMatrix,answer] = removeLowerTriangle (gaussMatrix,answer,dimension);
answer = fliplr(answer);
end
