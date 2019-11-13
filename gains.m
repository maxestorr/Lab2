function s = gain(A)
    sp = 0; 
    sn = 0;
    
    for i = 1:length(A)
        sp = sp + A(i, 1);
        sn = sn + A(i, 2);
    end

    s = I(sp, sn) - remainder(A, sp, sn);
end

function s = I(p, n)
    s = -(p / (p + n)) * (log2((p / (p + n)) - (n / (p + n))) * log2((n / (p + n))));
end

function s = remainder(A, sp, sn)
    s = 0;
    
    for i = 1:length(A)
        p = A(i, 1);
        n = A(i, 2);
       
        s = s + (((p + n) / (sp + sn)) * I(p, n));
    end
end