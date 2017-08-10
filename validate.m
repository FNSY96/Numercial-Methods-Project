function [ bool ] = validate( equ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
bool = 1;
syms x
try
    v = eval(equ);
    try
        b = children(v);
    catch
         bool = 0;
    end
catch
    bool = 0;
end

end

