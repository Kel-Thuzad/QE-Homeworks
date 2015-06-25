function r = FloatFilter(d,g)
    n=length(g);
    q = zeros(1,n);
   
    for k = 1:length(d)
        q(2:n) = q(1:n-1);
        q(1)= d(k);
        
    r(k) = sum(q.*g);    
    end
    end
   