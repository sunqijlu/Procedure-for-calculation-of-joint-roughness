close all
clc
figure('Position', [0, 0, 800, 800]);
x = zeros(2,2); % Initial 2 by 2 zero matrix.
maxstep=5;
showit(x,1,maxstep,0,0,'Initial matrix');

h = 0.5; % [0 1], Close to zero results smooth landscapes.
delta=2;
for step=2:maxstep
    ran=2^(-step*h)*sqrt(1-2^(2*h-2))*normrnd(0.5,1)*delta;
    x = diamond_square_algorithm(x,ran,step,maxstep);
    % In each step, the range for random numbers 
end

% If you open this, then the final output matrix is converted to a POVRAY
% input file. If you have Povray installed, then you can render it.
exportToPovray(x)