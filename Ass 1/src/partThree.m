clc; clear;

%Part 3
%p 2.1
m = 2; n = 4;
maxim = [6; 8; 5; 9];
A = [2, 1, 1, 3; 1, 3, 1, 2];
b = [5 ; 3];
[~, r1m] = mySimplex(m, n, maxim, b, A);

cnd = 1:4;
lb = [0,0,0,0];
r1i = intlinprog(-maxim, cnd, A, b , [], [], lb, []);

%p 2.2
m = 4; n = 2;
maxim = [2; 1];
A = [2, 1; 2, 3; 4, 1; 1, 5];
b = [4; 3; 5; 1];
[~, r2m] = mySimplex(m, n, maxim, b, A);

cnd = 1:2;
lb = [0,0];
r2i = intlinprog(-maxim, cnd, A, b , [], [], lb, []);

%p 2.8
m = 8; n = 2;
maxim = [3; 2];
A = [1, -2; 1, -1; 2, -1; 1, 0; 2, 1; 1, 1; 1, 2; 0, 1];
b = [1; 2; 6; 5; 16; 12; 21; 10];
[~, r3m] = mySimplex(m, n, maxim, b, A);

cnd = 1:2;
lb = [0,0];
r3i = intlinprog(-maxim, cnd, A, b , [], [], lb, []);

clc;
disp("p 2.1: ");
disp(r1m);
disp(r1i);

disp("p 2.2: ");
disp(r2m);
disp(r2i);

disp("p 2.8: ");
disp(r3m);
disp(r3i);