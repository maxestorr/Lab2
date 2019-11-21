function gain = gains(data, column, labels_column, threshold)
    size = length(labels_column);
    
    % Sum of "Postive" and "Negative" examples
    sP = numel(labels_column(labels_column == 1));
    sN = numel(labels_column(labels_column == 0));
    
    % Call to functions that return the components of the gain equation
    entropyVal = entropy(sP, sN, size);
    remainderVal = remainder(data, column, labels_column, threshold);
    gain = entropyVal - remainderVal;
end

function [remainderVal, dataSplits, labels] = remainder(data, column, labels_column, threshold)
    V = length(labels_column);
    s1 = 0;
    s2 = 0;
    
    [P1,N1,P2,N2] = fast_splits(column,labels_column,threshold);
    
    % Total number of labels in the two splits
    V1 = P1 + N1;
    V2 = P2 + N2;
    
    % Remainder calculation for the two splits
    s1 = s1 + ((P1 + N1) / V) * entropy(P1, N1, V1);
    s2 = s2 + ((P2 + N2) / V) * entropy(P2, N2, V2);
    % Total the values for the two splits to get the remainder for this
    % particular attribute and threshold
    remainderVal = s1 + s2;
end

function entropyVal = entropy(P, N, size)
    P = (P / size); % Ratio of + 
    N = (N / size); % Ratio of -
    
    if P == 0 || N == 0
        % Fix a perfectly ordered system to have 0 entropy
        entropyVal = 0;
    else
        entropyVal = - P * log2(P) - N * log2(N);
    end
end