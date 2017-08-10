function exportTable(directory,matrix,titlesArray,numberOfIterations,delta,time)
% dlmwrite(directory,matrix,'delimiter','\t','precision','%15.5f');
fid = fopen(directory,'w');
for i = 1: size(titlesArray,2)
    fprintf(fid,'%s\t\t',string(titlesArray(i)));
end
fprintf(fid,'\n');
fprintf(fid,[repmat('%f\t', 1, size(matrix, 2)) '\n'], matrix');
fprintf(fid, strcat('Number of iterations: ',string(numberOfIterations)));
fprintf(fid, strcat('\t\t\tTime: ',string(time),'\tmillisecond'));
fprintf(fid, strcat('\nDelta: ',string(delta)));
fclose(fid);
end


% can create a new file
% insert absolute or relative
% '%10.5f"