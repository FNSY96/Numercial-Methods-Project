function [ coefficents ] = seperateComma( equ )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  coef = strsplit(equ,',');
  [r, siz] = size(coef);
  for i=1:siz
     coefficents(i) = str2num(char(coef(i)));
  end
end

