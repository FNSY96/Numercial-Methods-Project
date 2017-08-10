function exportTableLinearEqu(directory,matrix,extraData)
dlmwrite(directory,matrix,'delimiter','\t','precision','%15.5f');
fid = fopen(directory,'a+');
fprintf(fid, string(extraData));
% fprintf(fid, strcat('\t\t\tTime: ',string(time),'\tmillisecond'));
% fprintf(fid, strcat('\nError: ',string(error)));
fclose(fid);
end
