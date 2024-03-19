%% symbolicMatrixAlgebra.m
% Zachary Miller
% 14 Feb 2024

% For modified nodal analysis (MNA)

% Note:
%   When A * x = b --> x = inv(A) * b ...
%       b = [ 0 0 Vin]
%       x = [Va Vb I1]

clear; clc; close all;

% Define variables
syms R sC Vin Vout

% Set matrices
    % x = [Va; Vb; I1];
b = [0; 0; Vin];

% Initialize matrix "A"
A = [1/R -1/R 1; ...
    -1/R (1/R+sC) 0; ...
    1 0 0];
invA = inv(A); % compute inverse

% Output relationships
fprintf('Inverse of matrix "A": \n'); fprintf('\n');
disp(invA); % matrix inversion
x = invA*b; % Vout matrix

TF = invA(2,end); % Transfer function
fprintf('Circuit transfer function:\n\n\t%s\n',TF);
fprintf('\n');

% fprintf('Vout = Vin * %s\n', TF); % Vin(Vout)

fprintf('Other relationships:\n\n');
Va = x(1,1); % Va -> Vin
fprintf('\tVa = %s\n',Va);
Vb = x(2,1); % Vb -> Vin
fprintf('\tVb = %s\n',Vb);
I1 = x(3,1); % I1 -> Vin
fprintf('\tI1 = %s\n',I1);