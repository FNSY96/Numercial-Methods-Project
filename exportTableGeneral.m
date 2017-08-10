function exportTableGeneral(directory,arrayOfMatrices,numberOfRoots,time)
fid = fopen(directory,'w');
for i = 1 : numberOfRoots
fprintf(fid, '\nroot');
fprintf(fid, string(i));
fprintf(fid, '\n');
fprintf(fid,[repmat('%f\t', 1, size(arrayOfMatrices, 2)) '\n'], arrayOfMatrices(:,:,1,i)');
fprintf(fid, '\n');
fprintf(fid,'# of iterations:  ');
[row, column] = size(arrayOfMatrices(:,:,1,i));
fprintf(fid,string(row));
end
fprintf(fid, strcat('\nTime: ',string(time),'\tmillisecond'));
fclose(fid);
end
