function s = gains(data_column, labels, threshold) % Gain Function
    size = length(labels);
    
    % Sum of "Postive" and "Negative" examples
    sP = 0;
    sN = 0;
    
    for i = 1:size
        if labels(i) == 1
            sP = sP + 1;
        else
            sN = sN + 1;
        end
    end
    
    s = I(sP, sN, size) - remainder(A);
end

function s = remainder(A) % Remainder Function
    V = length(A);
    s = 0;
    
    for i = 1:V
        P = A(i, 1);
        N = A(i, 2);
        
        s = s + ((P + N) / V) * I(P, N, V);
    end
end

function s = I(P, N, size) % Entropy Function
    P = (P / size); % Ratio of + 
    N = (N / size); % Ratio of -
    s = - P * log2(P) - N * log2(N);
end