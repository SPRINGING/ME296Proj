%% ME296MA Final Project: Anke Zhang, Di Wu, Ziang Wang
clear
close all

z0Bar = [8; 8; 0; 0];
zNBar = [0; 0; 0; 0];
N = 70;
zMax = [20 10 10 2*pi]';
zMin = [-20 -5 -10 -2*pi]';

[feas, zOpt, uOpt] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax);
fileName = 'FarInitial';
cartPlot(zOpt, uOpt, N, fileName);
fileName = '../Video/FarInitial';
cartMovie(zOpt, uOpt, N, fileName);


close all

z0Bar = [3; 3; 0; 0];
zNBar = [0; 0; 0; 0];
N = 70;
zMax = [20 10 10 2*pi]';
zMin = [-20 -5 -10 -2*pi]';

[feas, zOpt, uOpt] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax);
fileName = 'NearInitial';
cartPlot(zOpt, uOpt, N, fileName);
fileName = '../Video/NearInitial';
cartMovie(zOpt, uOpt, N, fileName);










