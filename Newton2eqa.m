function [x,y] = Newton2eqa(x0, y0, M, f1, f2, f11, f12, f21, f22)
    % x0 y0 initial points, iterate M times
    % f1 ,f2 two functions
    % f11 = f1x, f12 = f1y, f21 = f2x, f22 = f2y
    X = [x0; y0];
    x = X(1,1);
    y = X(2,1);
    for i = 1 : M
        F = [f1(x, y); f2(x, y)];
        H = -inv([f11(x,y), f12(x,y) ; f21(x,y), f22(x,y)]) * F;
        X = X + H;
        x = X(1,1);
        y = X(2,1);    
    end
end