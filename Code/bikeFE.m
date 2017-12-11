function zp = bikeFE(z, u)
% Function of the Car dynamic model

    TS = 0.2; % Time difference
    lf = 1.738; % Distance from Center of Mass to front wheel 
    lr = 1.738; % Distance from Center of Mass to back wheel 
    zp = sdpvar(4,1); % creating Yalmip variables. 
    zp(1) = z(1)+TS*z(3)*cos(z(4)+u(2)); % updating X position
    zp(2) = z(2)+TS*z(3)*sin(z(4)+u(2)); % updating y position
    zp(3) = z(3)+TS*u(1);                % updating velocity
    zp(4) = z(4)+TS*z(3)*sin(u(2))/lr;   % updating heading angle
end