function [new_features, new_labels] = kFold(k, features, labels)
    data_length = length(labels);
    A = 1:data_length;
    A = A(randperm(length(A)));
        
    remainder_value = mod(data_length, k);
    A = A(1: data_length-remainder_value);
    
    indices_array = reshape(A, [], k);
    
    new_features = zeros(length(indices_array),size(features,2), k);
    new_labels = zeros(length(indices_array), k);

    for i = 1:k
        for j = 1:length(indices_array)
            for k = 1:size(features,2)
                new_features(j,k,i) = features(indices_array(j, i), k);
            end
            new_labels(j,i) = labels(indices_array(j,i));
        end
    end
end
