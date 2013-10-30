
clear all;
clc;

A = input('Enter coefficient matrix: ');
B = input('Enter RHS Vector: ');

%Example 1
% A = [   0.3 0.9 0.9 0.4 0.2;
%         0.6 0.1 0	0.8 0.5;
%         0.7 0	0.9 0.4 0.7;
%         0.8 0.7 0.4 0.2 0.7;
%         0.4	0.1 0.2 0.5 0.1 ];
% B = [   0.9;
%         0.7;
%         0.9;
%         0.7;
%         0.5 ];

disp('----------------Coefficient Matrix : RHS------------------');
disp( [A B] );

if (size(A,1) ~= size(B,1))
    disp('Mismatch in number of equations and RHS vector');
    return;
end

fuzzyEquation(A,B,true);



