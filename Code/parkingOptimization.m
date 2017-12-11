function [feas, zOpt, uOpt] = parkingOptimization(N, z0Bar, zNBar, zMin, zMax)
    % Static variable
    z0 = z0Bar;
    zN = zNBar;
    TS = 0.2; % Time step

    % initalizatioin of the Yalmip variable
    z = sdpvar(4,N+1);
    assign(z(:,1),z0);
    u = sdpvar(2,N);

    % Define objective function and constraints
    umin = [-1.5*TS -0.6]';
    umax = [1.5*TS 0.6]';
    zmax = zMax;
    zmin = zMin;
    % objective = norm(z(:,N-1)-zN)^2 + ...
    %             norm(z(:,N)-zN)^2 + ...
    %             norm(z(:,N+1)-zN)^2;
    objective = 0;
    constraints = [];
    for i = 1:N
        constraints = [constraints zmin<=z(:,i)<=zmax umin<=u(:,i)<=umax z(:,i+1) == bikeFE(z(:,i),u(:,i))];
        if i <= N-1       
            constraints = [constraints -0.2<=u(2,i+1)-u(2,i)<=0.2];
            constraints = [constraints -0.06<= u(1,i+1)-u(1,i) <= 0.06];
        end
        objective = objective + sqrt((z(1, i + 1) - z(1, i))^2 + (z(2, i + 1) - z(2, i))^2);
    end
    constraints = [constraints z(:,1)==z0 z(:,N+1)==zN, zmin<=z(:,N+1)<=zmax];

    % Set options for YALMIP and solver
    options = sdpsettings('verbose',0,'solver','IPOPT','usex0',1);
    sol = optimize(constraints, objective, options);

    % seting solutioin
    opt_z = value(z);
    opt_u = value(u);
    opt_J = value(objective);

    if (sol.problem == 0)
        feas = 1;
        zOpt = opt_z;
        uOpt = opt_u;
    else
        feas = 0;
        zOpt = [];
        uOpt = [];
    end







