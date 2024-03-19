%% invertingAmplifierMNA.m
% Zachary Miller
% 15 Feb 2024

clear; clc; close all;

% Define variables
syms R1 R2 Vin Vout

% Set matrices
    % x = [Va; Vb; Vc; I1; I0]; % 5x1
b = [0; 0; 0; 0; Vin]; % 5x1

% Initialize matrix "A"
A = [1/R1 -1/R1 0 1 0; ...
    -1/R1 (1/R1 + 1/R2) -1/R2 0 0; ...
    0 -1/R2 1/R2 0 1; ...
    0 1 0 0 0; ...
    1 0 0 0 0];
invA = inv(A); % compute inverse

% Output relationships
fprintf('Inverse of matrix "A": \n'); fprintf('\n');
disp(invA); % matrix inversion
x = invA*b; % Vout matrix

TF = invA(round(length(A)/2),end); % Transfer function
fprintf('Circuit transfer function:\n\n\t%s\n',TF);
fprintf('\n');