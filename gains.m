function s = gains(data_column, labels, threshold) % Gain Function
    size = length(labels);
    
    % Sum of "Postive" and "Negative" examples
    sP = numel(labels(labels == 1));
    sN = numel(labels(labels == 0));
    
    s = entropy(sP, sN, size) - remainder(data_column, labels, threshold);
end

function s = remainder(data_column, labels, threshold) % Remainder Function
    V = length(data_column);
    s1 = 0;
    s2 = 0;
    s = 0;
    
    for i = 1:V
        [~, ~, split1Labels, split2Labels] = decisionSplit(data_column, labels, threshold);
        
        P1 = numel(split1Labels(split1Labels == 1));
        N1 = numel(split1Labels(split1Labels == 0));
        P2 = numel(split2Labels(split2Labels == 1));
        N2 = numel(split2Labels(split2Labels == 0));
        
        V1 = P1 + N1;
        V2 = P2 + N2;

        s1 = s1 + ((P1 + N1) / V) * entropy(P1, N1, V1);
        s2 = s2 + ((P2 + N2) / V) * entropy(P2, N2, V2);
        s = s1 + s2;
    end
end

function s = entropy(P, N, size) % Entropy Function
    P = (P / size); % Ratio of + 
    N = (N / size); % Ratio of -
    s = - P * log2(P) - N * log2(N);
end