function output = kFold(k, Labels)
    % Output k n.o. arrays containing the indices for the respective fold.
    data_length = length(Labels);
    A = 1:data_length;
    A = A(randperm(length(A)));
        
    remainder_value = mod(data_length, k);
    A = A(1: data_length-remainder_value);
    
    main_array = reshape(A, [], k);
        
    output = main_array();
end
