clc; clear;

% Part 4
m = 2; n = 3;
maxim = [4; 1; 1];
A = [2, 1, 2; 3, 3, 1];
b = [4; 3];
[~, r1m] = mySimplex(m, n, maxim, b, A);

disp(r1m);