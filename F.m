function result = F(x, S)
    % Funcția F folosită în Blowfish
    
    % Împarte x în 4 octeți
    d = zeros(1,4);
    d(1) = bitshift(bitand(x, 0xff000000), -24);
    d(2) = bitshift(bitand(x, 0x00ff0000), -16);
    d(3) = bitshift(bitand(x, 0x0000ff00), -8);
    d(4) = bitand(x, 0x000000ff);
    
    % Aplică S-boxes
    result = mod(S(1, d(1) + 1) + S(2, d(2) + 1), 2^32);
    result = bitxor(result, S(3, d(3) + 1));
    result = mod(result + S(4, d(4) + 1), 2^32);
end