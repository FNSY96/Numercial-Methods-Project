function [ finalArray,mesg ] = getCoefficent(fullString )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
  arrayWithSemi = strsplit(fullString,';');
  mesg = '';
  [row, col]= size(arrayWithSemi);
  [r, siz] = size(seperateComma(strjoin(arrayWithSemi(1))));
for i=1:col
    arr = seperateComma(strjoin(arrayWithSemi(i)));
    if(size(arr) ~= siz)
     mesg = ('%%%% error in dimentions, try again %%%%');
     disp(mesg);
     finalArray = [];
     return;
    end
    finalArray(i,:) = arr;     
end
end

