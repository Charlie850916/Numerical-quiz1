function root = Newton(x0, M, delta, eps, f, f_)
    % x0 inital value, iterate M times, f function, f_ differential of f
    % |e| < delta (default = 0), |f(root)| < eps (default = 0)
    v = f(x0);
    if(abs(v) < eps)
        root = x0;
        return
    end
    for i = 1 : M
        root = x0 - v/f_(x0);
        v = f(root);
        if( abs(root-x0) < delta || abs(v) < eps)
            return
        end
        x0 = root;
    end
end