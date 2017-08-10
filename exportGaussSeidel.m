function exportGaussSeidel(directory,matrix,extraData,errorsMatrix)
fid = fopen(directory,'w');
fprintf(fid,[repmat('%f\t', 1, size(matrix, 2)) '\n'], matrix');
fprintf(fid, char(extraData));
fprintf(fid, '\n');
fprintf(fid, 'errors matrix: \n');
fprintf(fid,[repmat('%f\t', 1, size(errorsMatrix, 2)) '\n'], errorsMatrix');
fclose(fid);
end
