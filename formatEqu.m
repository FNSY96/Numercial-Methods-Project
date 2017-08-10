function [ newEqu] = formatEqu( equ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms x;
streval = eval(equ);
strChild = children(streval);
[r,siz] = size(strChild);
newEqu = '';
found = 0;
for i=1:siz
    critcDig = expand(strChild(i)/x);
    [r,sizeq] = size(str2num(char(critcDig)));
    if sizeq == 1
        found = 1;
        break;
    end
end
if found == 1
    s='(';
    for j=1:siz
        if j==i
            continue;
        end
        s = strcat(s,'+',char(strChild(j)));
    end
    if(equ=='x')
        s = strcat(s,'1');
    end
    s = strcat(s,')/(-1*',char(critcDig),')');
else
    s = strcat(equ,'+x');
end
    if isnumeric(eval(s)) == 1
        newEqu = num2str(eval(s));
    else
       newEqu = char(eval(s));
    end
end

