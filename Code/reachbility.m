clear
close all

zNBar = [0; 0; 0; 0];
N = 70;
zMin = [-20 -5 -10 -2*pi]';
zMax = [20 10 10 2*pi]';

zSet1 = zMin(1) : zMax(1);
zSet2 = zMin(2) : zMax(2);

reachbilitySet = zeros(length(zSet1), length(zSet2));



for i = 1:length(zSet1)
	parfor j = 1 : length(zSet2)
		z0Bar = [zSet1(i); zSet2(j); 0; 0];
		[feas] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax)
		reachbilitySet(i, j) = feas;
	end
end



[X, Y] = meshgrid(zSet1, zSet2)
surf(X, Y, reachbilitySet')
view(0, 90)
save('reachv5.mat', 'reachbilitySet', 'X', 'Y')


clear
close all

zNBar = [0; 0; 0; 0];
N = 70;
zMin = [-20 -5 -5 -2*pi]';
zMax = [20 10 5 2*pi]';

zSet1 = zMin(1) : zMax(1);
zSet2 = zMin(2) : zMax(2);

reachbilitySet = zeros(length(zSet1), length(zSet2));



for i = 1:length(zSet1)
	parfor j = 1 : length(zSet2)
		z0Bar = [zSet1(i); zSet2(j); 0; 0];
		[feas] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax)
		reachbilitySet(i, j) = feas;
	end
end



[X, Y] = meshgrid(zSet1, zSet2);
surf(X, Y, reachbilitySet')
view(0, 90)
save('reachv55.mat', 'reachbilitySet', 'X', 'Y')

clear
close all

zNBar = [0; 0; 0; 0];
N = 70;
zMin = [-20 -5 -3 -2*pi]';
zMax = [20 10 3 2*pi]';

zSet1 = zMin(1) : zMax(1);
zSet2 = zMin(2) : zMax(2);

reachbilitySet = zeros(length(zSet1), length(zSet2));



for i = 1:length(zSet1)
	parfor j = 1 : length(zSet2)
		z0Bar = [zSet1(i); zSet2(j); 0; 0];
		[feas] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax)
		reachbilitySet(i, j) = feas;
	end
end



[X, Y] = meshgrid(zSet1, zSet2);
surf(X, Y, reachbilitySet')
view(0, 90)
save('reachv3.mat', 'reachbilitySet', 'X', 'Y')

