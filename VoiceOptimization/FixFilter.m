function r = FixFilter(d,g,b)
    n=length(g);
    q =round(zeros(1,n));

    for k = 1:length(d)
        q(2:n) = q(1:n-1);
        q(1)= d(k);
        r(k) = sum(q.*g)/(2^b);
    end
end
