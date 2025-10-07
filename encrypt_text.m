function ciphertext = encrypt_text(plaintext, P, S)
    % Convertește textul în blocuri și criptează
    
    % Padding pentru ultimul bloc (PKCS#7)
    plaintext_bytes = uint8(plaintext);
    len = length(plaintext_bytes);
    pad_len = 8 - mod(len, 8);
    if pad_len == 0
        pad_len = 8;
    end
    padding = repmat(uint8(pad_len), 1, pad_len);
    padded_data = [plaintext_bytes, padding];
    
    % Criptează fiecare bloc
    ciphertext_bytes = [];
    for i = 1:8:length(padded_data)
        block = padded_data(i:i+7);
        left = typecast([block(1:4)], 'uint32');
        right = typecast([block(5:8)], 'uint32');
        
        [enc_left, enc_right] = encrypt_block(left, right, P, S);
        
        ciphertext_bytes = [ciphertext_bytes, ...
            typecast(enc_left, 'uint8'), ...
            typecast(enc_right, 'uint8')];
    end
    
    % Convertește în hex pentru afișare
    ciphertext = dec2hex(ciphertext_bytes)';
    ciphertext = ciphertext(:)';
end