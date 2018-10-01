function root = Bisection(a, b, M, delta, eps, f)
    % [a,b] interval, iterate M times, f function
    % |e| < delta (default = 0), |f(root)| < eps (default = 0)
    u = f(a);
    v = f(b);
    e = b-a;
    if(sign(u) == sign(v))
        root = 5487; % bad initial a b
        return
    end
    for i = 1 : M
        e = e/2;
        root = a + e;
        w = f(root);
        if(abs(e) < delta || abs(w) < eps)
            return
        end
        if(sign(w) ~= sign(u))
            b = root;
            v = w;
        else
            a = root;
            u = w;
        end
    end
end