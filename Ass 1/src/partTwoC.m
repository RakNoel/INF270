clc; clear;

% Part 2 C
i = [3;4;5];
ii = [1;4;5];
iii = [1;2;5];
iv = [1;2;3];
v = [1;2;4];

task = [i, ii, iii, iv, v];

m = 3; n = 2;
b = [1;3;5];
A = [1 -1; 2 -1; 0 1];

i = 0;
for p = task
    i = i + 1;
    disp("xb" + i + ": ");
    [xb, xn] = myBasics(p, m, n, b, A);
    disp(xb);
    disp("xn" + i + ": ");
    disp(xn)
end