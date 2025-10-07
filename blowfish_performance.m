% test_blowfish_simplu.m
% Test simplu pentru verificarea algoritmului Blowfish

clear; clc;


mesaj_original = 'Hello World!';
cheia = 'parola123';

fprintf('=== TEST 1 ===\n\n');
fprintf('Mesaj original: %s\n', mesaj_original);
fprintf('Cheia folosită: %s\n\n', cheia);


fprintf('Inițializare Blowfish...\n');
tic;
[P, S] = initialize_blowfish(cheia);
timp_init = toc;
fprintf('Timp inițializare: %.4f secunde\n\n', timp_init);

% Măs t de criptare
fprintf('Criptare în curs...\n');
tic;
mesaj_criptat = encrypt_text(mesaj_original, P, S);
timp_criptare = toc;
fprintf('Text criptat (hex): %s\n', mesaj_criptat);
fprintf('Timp criptare: %.4f secunde\n\n', timp_criptare);

% Măs t de decriptare
fprintf('Decriptare în curs...\n');
tic;
mesaj_decriptat = decrypt_text(mesaj_criptat, P, S);
timp_decriptare = toc;
fprintf('Text decriptat: %s\n', mesaj_decriptat);
fprintf('Timp decriptare: %.4f secunde\n\n', timp_decriptare);

% Verificăm dacă decriptarea a funcționat corect
if strcmp(mesaj_original, mesaj_decriptat)
    fprintf('✓ SUCCESS! Textul decriptat este identic cu originalul.\n');
else
    fprintf('✗ EROARE! Textul decriptat nu corespunde cu originalul.\n');
end

% Afișăm timpul total
timp_total = timp_init + timp_criptare + timp_decriptare;
fprintf('\nTimp total: %.4f secunde\n', timp_total);