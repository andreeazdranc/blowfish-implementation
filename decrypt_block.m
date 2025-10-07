function [left, right] = decrypt_block(left, right, P, S)
    % Decriptează un bloc de 64 biți
    % Similar cu encrypt_block, dar cu P în ordine inversă
    
    % 16 runde Feistel în ordine inversă
    for i = 18:-1:3
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
    right = bitxor(right, P(2));
    left = bitxor(left, P(1));
end