function [ delta ] = getError( equ, gx, point, calcRoot )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms x
eqeval = eval(equ);
alpha= fzero(matlabFunction(eqeval),point);
x = alpha;
galpha = eval(gx);
x = calcRoot;
groot = eval(gx);
del = galpha -groot;
delta = eval(num2str(del));
end

