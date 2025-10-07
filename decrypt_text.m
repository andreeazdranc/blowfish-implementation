function plaintext = decrypt_text(ciphertext, P, S)
    % Convertește textul cifrat din hex și decriptează
    
    % Convertește din hex în bytes
    ciphertext_bytes = [];
    for i = 1:2:length(ciphertext)
        ciphertext_bytes = [ciphertext_bytes, hex2dec(ciphertext(i:i+1))];
    end
    ciphertext_bytes = uint8(ciphertext_bytes);
    
    % Decriptează fiecare bloc
    plaintext_bytes = [];
    for i = 1:8:length(ciphertext_bytes)
        block = ciphertext_bytes(i:i+7);
        left = typecast([block(1:4)], 'uint32');
        right = typecast([block(5:8)], 'uint32');
        
        [dec_left, dec_right] = decrypt_block(left, right, P, S);
        
        plaintext_bytes = [plaintext_bytes, ...
            typecast(dec_left, 'uint8'), ...
            typecast(dec_right, 'uint8')];
    end
    
    % Elimină padding-ul
    pad_len = plaintext_bytes(end);
    plaintext_bytes = plaintext_bytes(1:end-pad_len);
    
    % Convertește în text
    plaintext = char(plaintext_bytes);
end