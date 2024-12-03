# Stream Deck cu Arduino Uno

## Introducere

**Nume proiect**: Stream Deck

Acest proiect se bazeaza pe dezvoltarea unui stream deck personalizat utilizand doua breadboard-uri, 4/6 display-uri cu carcase printate 3D, 4/6 butoane pentru fiecare display si un Arduino Uno.  

### Ce face?  
Dispozitivul permite utilizatorului sa interactioneze rapid cu diverse aplicatii sau functii prin apasarea unor butoane. Fiecare display, montat pe un buton, afiseaza o imagine reprezentativa pentru functia atribuita, iar apasarea sa deschide aplicatia sau executa comanda configurata (de exemplu, un buton cu imaginea Google Meet deschide aplicatia corespunzatoare).  

### Scopul  
Scopul proiectului este de a crea un dispozitiv accesibil si personalizabil, care sa usureze fluxul de lucru al utilizatorilor in activitati precum streaming, intalniri virtuale sau alte procese zilnice.  

### Ideea de la care am pornit  
Mi-am dorit o solutie alternativa la stream deck-urile comerciale, care sa fie mai accesibila, utilizand componente disponibile si usor de integrat.  

### De ce este util?  
Acest proiect automatizeaza diverse procese si creste eficienta utilizatorului, permitand acces rapid la functii diferite. Este usor de utilizat, la indemana si economiseste timp, facand interactiunea cu calculatorul mai rapida si mai intuitiva. Prin realizarea acestuia, am invatat mai multe despre electronica, programare si design 3D.   

---

## Descriere generala

Proiectul este impartit in module hardware si software care colaboreaza pentru a realiza functionalitatea dorita.  

### Schema bloc

1. **Arduino Uno**  
   - Controlerul principal care interpreteaza comenzile de la butoane si controleaza display-urile.  

2. **Breadboard-uri**  
   - Suport pentru conectarea componentelor hardware.  

3. **Butoane cu display-uri montate in carcase 3D**  
   - Fiecare buton este acoperit de un display ce afiseaza o imagine reprezentativa. Display-ul este montat intr-o carcasa printata 3D care il pozitioneaza deasupra butonului. Apasarea butonului trimite o comanda catre Arduino pentru a executa functia specifica.  

4. **Conexiuni electrice**  
   - Fire pentru alimentare si comunicare intre componente.  

### Interactiunea dintre module  
- La apasarea unui buton, semnalul este transmis catre Arduino, care recunoaste comanda, declanseaza functia asociata (ex: deschiderea unei aplicatii pe PC) si actualizeaza display-ul, daca este necesar.  

Aceasta structura modulara permite extinderea cu butoane si functii suplimentare.  

<img width="900" alt="Screenshot 2024-12-03 at 02 10 00" src="https://github.com/user-attachments/assets/fef912ea-c0c5-4249-b9b1-13b8d5b6e6f2">

