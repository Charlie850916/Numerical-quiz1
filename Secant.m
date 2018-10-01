function root = Secant(a, b, M, delta, eps, f)
    % x0 = a, x1 = b initial points, iterate M times, f function
    % |e| < delta (default = 0), |f(root)| < eps (default = 0)
    fa = f(a);
    fb = f(b);
    if(M==0)
        root = a;
        return
    end
    if(M==1)
        root = b;
        return
    end
    for i = 2 : M
        if(abs(fa) > abs(fb))
            tmp1 = a; % swap a b
            a = b;
            b = tmp1;
            tmp2 = fa; % swap fa fb
            fa = fb;
            fb = tmp2;
        end
        s = (b-a) / (fb-fa);
        b = a;
        fb = fa;
        a = a - fa * s;
        fa = f(a);
        root = a;
        if(abs(fa) < eps || abs(b-a) < delta)
            return
        end
    end
end