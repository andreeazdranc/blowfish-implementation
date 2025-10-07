% blowfish_demo.m
% Demonstrație a algoritmului Blowfish pentru criptare/decriptare

% - Această implementare este simplificată pentru scopuri educaționale
% - Folosește valori de inițializare simplificate pentru S-boxes
% - Nu include toate optimizările din implementarea standard

clear; clc;

% Introducerea datelor
plaintext = input('Introduceți textul pentru criptare: ', 's');
key = input('Introduceți cheia de criptare: ', 's');

% Verificarea cheii (lungime între 4-56 caractere)
if length(key) < 4 || length(key) > 56
    error('Cheia trebuie să aibă între 4 și 56 de caractere!');
end

% Inițializarea Blowfish
disp('Inițializare Blowfish...');
[P, S] = initialize_blowfish(key);

% Procesarea textului pentru criptare
disp('Criptare în desfășurare...');
ciphertext = encrypt_text(plaintext, P, S);
disp(['Text criptat (hex): ' ciphertext]);

% Decriptarea textului
disp('Decriptare în desfășurare...');
decrypted_text = decrypt_text(ciphertext, P, S);
disp(['Text decriptat: ' decrypted_text]);

% Verificare
if strcmp(plaintext, decrypted_text)
    disp('Succes! Textul a fost criptat și decriptat corect.');
else
    disp('Eroare! Textul decriptat nu corespunde cu originalul.');
end