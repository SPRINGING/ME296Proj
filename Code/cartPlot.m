function littlePlot = cartPlot(zOpt, uOpt, N, fileName)
% This function plot the result after the optized 
    figure()
    subplot(2,2,1)
    plot(0:N,zOpt(1,:),'LineWidth',1.5)
    title('X Position vs. Time')
    xlabel('Time')
    ylabel('X Position')
    grid on
    subplot(2,2,2)
    plot(0:N,zOpt(2,:),'LineWidth',1.5)
    title('Y Position vs. Time')
    xlabel('Time')
    ylabel('Y Position')
    grid on
    subplot(2,2,3)
    plot(0:N,zOpt(3,:),'LineWidth',1.5)
    title('Velocity vs. Time')
    xlabel('Time')
    ylabel('Velocity')
    grid on
    subplot(2,2,4)
    plot(0:N,zOpt(4,:),'LineWidth',1.5)
    title('Heading Angle vs. Time')
    xlabel('Time')
    ylabel('Heading Angle')
    grid on
    saveas(gcf,['../Image/', fileName, '1.jpg'])

    figure()
    subplot(2,1,1)
    plot(0:N-1,uOpt(1,:),'LineWidth',1.5)
    title('Acceleration VS Time')
    xlabel('Time')
    ylabel('a')
    grid on
    subplot(2,1,2)
    plot(0:N-1,uOpt(2,:),'LineWidth',1.5)
    title('Steering Angle VS Time')
    xlabel('Time')
    ylabel('beta')
    grid on
    saveas(gcf,['../Image/', fileName, '2.jpg'])

    figure()
    plot(zOpt(1,:),zOpt(2,:),'LineWidth',1.5)
    title('Position of Center of Mass')
    xlabel('X Position')
    ylabel('Y Position')
    grid on
    saveas(gcf,['../Image/', fileName, '3.jpg'])

    figure()
    axis([-10 10 -10 10]);
    axis equal
    % Initial center and orientation of line (uncaptured - see below)
    cx = zOpt(1, 1);
    cy = zOpt(2, 1);
    theta = zOpt(4, 1);
    phi = uOpt(2, 1);
    lf = 1.738;
    lr = 1.738;
    L = lr + lf;
    Lty = 1;
    Lh2 = line([cx+L/2*cos(theta)-Lty/2*cos(phi + theta) cx+L/2*cos(theta)+Lty/2*cos(phi + theta)],...
        [cy+L/2*sin(theta)-Lty/2*sin(phi + theta) cy+L/2*sin(theta)+Lty/2*sin(phi + theta)]);
    Lh2.Color = 'black';
    Lh2.LineWidth = 5;
    Lh = line([cx-L/2*cos(theta) cx+L/2*cos(theta)],...
        [cy-L/2*sin(theta) cy+L/2*sin(theta)]);
    Lh.Color = 'red';
    Lh.LineWidth = 3;
    Lh3 = line([-7 -3], [0 0]);
    Lh3.Color = 'blue';
    Lh3.LineWidth = 10;
    Lh4 = line([2.5 6.5], [0 0]);
    Lh4.Color = 'blue';
    Lh4.LineWidth = 10;

    % curve = animatedline('LineWidth', 2);
    grid on
    hold on
    for j = 1:(length(zOpt) - 1)
        if(mod(j, 5) == 0)
            cx = zOpt(1, j + 1);
            cy = zOpt(2, j + 1);
            theta = zOpt(4, j);
            phi = uOpt(2, j);
            % addpoints(curve, cx, cy);
            tempL = line([cx+L/2*cos(theta)-Lty/2*cos(phi + theta) cx+L/2*cos(theta)+Lty/2*cos(phi + theta)],...
                [cy+L/2*sin(theta)-Lty/2*sin(phi + theta) cy+L/2*sin(theta)+Lty/2*sin(phi + theta)]);
            tempL.Color = 'black';
            tempL.LineWidth = 5;
            tempL2 = line([-L/2*cos(theta), +L/2*cos(theta)] + cx,[-L/2*sin(theta), +L/2*sin(theta)] + cy);
            tempL2.Color = 'red';
            tempL2.LineWidth = 3;
        end
    end
    hold on
    hf = plot(zOpt(1, :), zOpt(2, :), 'k')
    set(hf,'LineWidth',2)
    hold off
    saveas(gcf,['../Image/', fileName, '3M.jpg'])

end










