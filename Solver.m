
clear all;
clc;

A = input('Enter coefficient matrix: ');
B = input('Enter RHS Vector: ');

disp('----------------Coefficient Matrix------------------------');
disp(A);
disp('');
disp('---------------RHS Vector---------------------------------');
disp(B);

if (size(A,1) ~= size(B,1))
    disp('Mismatch in number of equations and RHS vector');
    return;
end

fuzzyEquation(A,B);



