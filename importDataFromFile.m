
% str = input('enter file directory: ');
% fid = fopen(str,'r');
% data = fread(fid);
% charData = char(data);
% fclose(fid);
% for i = 1:size(charData)
%         disp(charData(i))
% end
% '/Users/FNSY/Desktop/untitled.txt'
% str = input('enter file directory: ');

% for i = 1:size(data)
%     %     if isnumeric(data(i))
%     %         disp(data(i))
%     value = getfield(data, 'data');
%     disp(value)
%     value = getfield(data, 'textdata');
%     disp(value)
%     %     else
%     %         disp("fady")
%     %     end
% end

function [data] = importDataFromFile(str)
delimiterIn = ',';
data = importdata(str,delimiterIn);
%disp(data(1))
end
% '/Users/FNSY/Desktop/untitled.txt'