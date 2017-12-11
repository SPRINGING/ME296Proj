function littleMovie = cartMovie(zOpt, uOpt, N, fileName)
% This function make the movie after optimization.
    close all
    figure('units','normalized','outerposition',[0 0 1 1])
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
    Lh2.LineWidth = 10;
    Lh = line([cx-L/2*cos(theta) cx+L/2*cos(theta)],...
        [cy-L/2*sin(theta) cy+L/2*sin(theta)]);
    Lh.Color = 'red';
    Lh.LineWidth = 8;

    Lh3 = line([-7 -3], [0 0]);
    Lh3.Color = 'blue';
    Lh3.LineWidth = 10;

    Lh4 = line([2.5 6.5], [0 0]);
    Lh4.Color = 'blue';
    Lh4.LineWidth = 10;

    curve = animatedline('LineWidth', 2);
    grid on
    nFrames = N;
    F(nFrames) = struct('cdata',[],'colormap',[]);
    disp('Creating and recording frames...')


    for j = 1:nFrames
        cx = zOpt(1, j + 1);
        cy = zOpt(2, j + 1);
        theta = zOpt(4, j);
        phi = uOpt(2, j);
        addpoints(curve, cx, cy);
        set(Lh2,'xdata',[cx+L/2*cos(theta)-Lty/2*cos(phi + theta) cx+L/2*cos(theta)+Lty/2*cos(phi + theta)]...
        	   ,'ydata',[cy+L/2*sin(theta)-Lty/2*sin(phi + theta) cy+L/2*sin(theta)+Lty/2*sin(phi + theta)]);
        Lh2.Color = 'black';
        Lh2.LineWidth = 10;
        set(Lh,'xdata',[-L/2*cos(theta) +L/2*cos(theta)] + cx,'ydata', [-L/2*sin(theta) +L/2*sin(theta)] + cy);
        Lh.Color = 'red';
        Lh.LineWidth = 8;
        grid on
        axis([-10 10 -10 10]);
        % axis normal
        F(j) = getframe;
    end

    Fps = 24;
    nPlay = 1;
    movie(F,nPlay,Fps)
    video = VideoWriter(fileName,'MPEG-4');
    open(video);
    writeVideo(video, F);
    close(video);
    littleMovie = 1;

end










