function [gaussMatrix,answer] = removeLowerTriangle (gaussMatrix,answer,dimension)
row = 2;
for diagonal = 1 : dimension
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
end
end