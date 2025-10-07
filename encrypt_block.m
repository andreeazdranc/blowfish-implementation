function [left, right] = encrypt_block(left, right, P, S)    
    % 16 runde Feistel
    for i = 1:16
        left = bitxor(left, P(i));
        right = bitxor(right, F(left, S));
        
        % Swap
        temp = left;
        left = right;
        right = temp;
    end
    
    % Undo last swap
    temp = left;
    left = right;
    right = temp;
    
    % Post-procesare
    right = bitxor(right, P(17));
    left = bitxor(left, P(18));
end