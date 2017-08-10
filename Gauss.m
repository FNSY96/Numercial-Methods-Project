function [stage2] = Gauss(inputArray,answer)
% anyArray = [3,-0.1,-0.2;0.1,7,-0.3;0.3,-0.2,10];
dimension = size(inputArray,1);
gaussMatrix = reshape(inputArray,[dimension,dimension]);
row = 2;
for diagonal = 1 : dimension
    %??? ??diagonal ?? ?? ??? ?? current pivot ?? ?? ??? ?????? ???? ?????
    pivotVector = gaussMatrix(diagonal,:);
    pivotAnswerVector = answer(diagonal);
    while row <= dimension
        delta =  gaussMatrix(row,diagonal) / gaussMatrix(diagonal,diagonal);
        toBeAddedVector = times(delta, pivotVector);
        toBeAddedAnswerVector = times(delta, pivotAnswerVector);
        gaussMatrix(row,:) =  gaussMatrix(row,:) - toBeAddedVector;
        answer(row) =  answer(row) - toBeAddedAnswerVector;
        row = row + 1;
    end
    row = diagonal + 2;
    %???? ?? row = 2 ????? 2 ??? ?? diagonal ?????? ????????
end


stage2(dimension) = answer(dimension) / gaussMatrix(dimension,dimension);
i = dimension - 1;
while i > 0
    sigma = 0;
    for j = i + 1 : dimension
        sigma = sigma + gaussMatrix(i,j)*stage2(j);
    end
    stage2(i) = (answer(i) - sigma) / gaussMatrix(i,i);
    i = i - 1;
end
end
