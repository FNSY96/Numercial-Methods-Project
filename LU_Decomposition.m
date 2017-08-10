function [stage2] = LU_Decomposition(inputArray,answer)
% anyArray = [3,-0.1,-0.2;0.1,7,-0.3;0.3,-0.2,10];
dimension = size(inputArray,1);
lower = zeros(dimension);
upper = reshape(inputArray,[dimension,dimension]);
row = 2;
for diagonal = 1 : dimension
    %??? ??diagonal ?? ?? ??? ?? current pivot ?? ?? ??? ?????? ???? ?????
    lower (diagonal,diagonal) = 1;
    pivotVector = upper(diagonal,:);
    while row <= dimension
        delta =  upper(row,diagonal) / upper(diagonal,diagonal);
        lower(row,diagonal) = delta;
        toBeAddedVector = times(delta, pivotVector);
        upper(row,:) =  upper(row,:) - toBeAddedVector;
        row = row + 1;
    end
    row = diagonal + 2;
    %???? ?? row = 2 ????? 2 ??? ?? diagonal ?????? ????????
    %we can remove lines of lower matrix for gauss elimenation matrix only
end

stage1 = zeros(dimension,1);
stage1(1) = answer(1);
for i = 2: dimension
    sigma = 0;
    for j = 1 : i - 1
        sigma = sigma + (lower(i,j) * stage1(j));
    end
    stage1(i) = answer(i) - sigma;
end

stage2 = zeros(dimension,1);
stage2(dimension) = stage1(dimension) / upper(dimension,dimension);
i = dimension - 1;
while i > 0
    sigma = 0;
    for j = i + 1 : dimension
        sigma = sigma + upper(i,j)*stage2(j);
    end
    stage2(i) = (stage1(i) - sigma ) / upper(i,i);
    i = i - 1;
end


end