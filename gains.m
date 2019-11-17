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
    
    s = entropy(sP, sN, size) - remainder(data_column, threshold);
end

function s = remainder(data_column, threshold) % Remainder Function
    V = length(data_column);
    s = 0;
    
    for i = 1:V
        P = data_column(i, 1);
        N = data_column(i, 2);
        
        s = s + ((P + N) / V) * entropy(P, N, V);
    end
end

function s = entropy(P, N, size) % Entropy Function
    P = (P / size); % Ratio of + 
    N = (N / size); % Ratio of -
    s = - P * log2(P) - N * log2(N);
end