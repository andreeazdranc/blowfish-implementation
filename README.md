# Blowfish Implementation (MATLAB)

Implementare MATLAB a algoritmului de criptare simetrică Blowfish. Acest proiect oferă funcții pentru criptarea și decriptarea datelor, util pentru experimente educaționale și testarea securității datelor cu Blowfish.

## Caracteristici

- Criptare și decriptare folosind Blowfish
- Suport pentru mesaje și fișiere de diverse dimensiuni
- Exemplu de utilizare și cod comentat pentru învățare

## Utilizare

1. Clonează acest repository:

```
git clone https://github.com/andreeazdranc/blowfish-implementation.git
```

2. Intră în directorul proiectului şi deschide fișierele MATLAB în MATLAB/Octave.

3. Rulează exemplele incluse sau folosește funcțiile principale:

```
key = 'cheie123';
mesaj = 'Salut lume!';
criptat = blowfish_encrypt(mesaj, key);
decriptat = blowfish_decrypt(criptat, key);
```

## Cerințe

- MATLAB sau Octave
- Nu necesită toolbox-uri suplimentare

## Autor

[andreeazdranc](https://github.com/andreeazdranc)

---

> *Acest proiect este destinat scopurilor educaționale. Pentru aplicații critice de securitate folosiți implementări testate profesional!*
