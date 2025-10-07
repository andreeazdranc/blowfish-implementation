function [P, S] = initialize_blowfish(key)
    % Inițializează array-urile P și S pentru Blowfish
    % P: 18 elemente de 32 biți
    % S: 4 x 256 elemente de 32 biți
    
    % Valorile inițiale (primele cifre ale lui PI în hexazecimal)
    P_init = [ ...
        0x243f6a88, 0x85a308d3, 0x13198a2e, 0x03707344, 0xa4093822, 0x299f31d0, ... 
        0x082efa98, 0xec4e6c89, 0x452821e6, 0x38d01377, 0xbe5466cf, 0x34e90c6c, ...
        0xc0ac29b7, 0xc97c50dd, 0x3f84d5b5, 0xb5470917, 0x9216d5d9, 0x8979fb1b
    ];
    
    % Inițializare S-boxes (pentru simplitate, folosim valori simplificate)
    S = zeros(4, 256);
    for i = 1:4
        for j = 1:256
            S(i,j) = uint32(mod(j * i * 0x9e3779b9, 2^32));
        end
    end
    
    % Copierea valorilor inițiale
    P = uint32(P_init);
    
    % Expandarea cheii
    key_bytes = uint32(double(key));
    key_len = length(key_bytes);
    
    % XOR cu cheia
    key_index = 1;
    for i = 1:18
        data = uint32(0);
        for k =1:4
            data = bitor(bitshift(data, 8), key_bytes(key_index));
            key_index = mod(key_index, key_len) + 1;
        end
        P(i) = bitxor(P(i), data);
    end
    
    % Inițializarea subkey-urilor 1:4
    left = uint32(0);
    right = uint32(0);
    
    for i = 1:2:18
        [left, right] = encrypt_block(left, right, P, S);
        P(i) = left;
        P(i+1) = right;
    end
    
    for i = 1:4
        for j = 1:2:256
            [left, right] = encrypt_block(left, right, P, S);
            S(i,j) = left;
            S(i,j+1) = right;
        end
    end
end