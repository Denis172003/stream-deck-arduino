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

## Detailed Description of Hardware Functionality

### 1. Modules and Components

**Microcontroller**: 
Arduino UNO serves as the central processing unit, managing inputs, outputs, and communication between connected components.

**Buttons with Displays**: 
The system includes 4 to 6 buttons, each paired with a 0.96-inch OLED display. Each display is housed in a 3D-printed case, which aligns it with the button. When pressed, the button sends a signal to the Arduino, which processes the action and updates the display, if required.

**OLED Displays**: 
4 to 6 0.96-inch OLED displays are connected to the Arduino using the I2C communication protocol. Each display shows a unique symbol or text that represents the associated button’s function.

**Breadboards**: 
Used to interconnect components without soldering. This setup allows for easy testing and adjustments.

**Electrical Connections**: 
Standard jumper wires are used to establish communication and power connections between components.

### 2. Interfaces and Communication

**Button-to-Microcontroller Interface**: 
Each button is connected to a digital input pin on the Arduino. The press of a button changes the signal state from HIGH to LOW, triggering an interrupt or a polling mechanism in the Arduino firmware.

**Display-to-Microcontroller Interface**: 
The OLED displays communicate with the Arduino through the I2C protocol. The Arduino acts as the master, while the displays function as slaves. Each display has a unique address to prevent conflicts.

### 3. Power Supply and Energy Consumption

**Power Source**: 
The system can be powered via USB (5V) or through an external power supply (7-12V) connected to the Arduino’s barrel jack.

**Energy Consumption**:
- **Arduino UNO**: Consumes approximately 50mA during standard operation.
- **OLED Displays**: Each display consumes approximately 20-30mA.
- **Buttons**: Minimal power consumption as they act as simple switches with negligible current draw.

**Total Consumption**: 
Assuming the use of 6 OLED displays, the total power consumption is estimated as:
- **Arduino**: 50mA
- **6 OLED Displays**: 6 × 30mA = 180mA
- **Buttons**: Negligible

**Total Current Draw**: 
50mA + 180mA = **230mA**

Given these values, a USB power source providing 500mA is sufficient to power the system.

### 4. Processing and Computation

**Input Handling**: 
The Arduino constantly checks for button presses using polling or interrupt-based methods.

**Command Processing**: 
When a button press is detected, the Arduino determines which button was pressed, executes the corresponding function (like launching a program on a connected PC), and updates the associated OLED display.

**Display Update**: 
The I2C communication is used to send instructions to the OLED displays, updating their content. This update may involve clearing the screen and redrawing a new icon or message.

### 5. System Expansion

**Scalability**: 
The modular design allows for the easy addition of more buttons and displays.

**Flexibility**: 
The use of breadboards facilitates quick reconfigurations and testing.

**Modifiability**: 
New functions can be assigned to buttons through simple firmware updates on the Arduino.



# Bill of Material

| #  | Name                     | Quantity | Datasheet |
|----|--------------------------|----------|-----------|
| 1  | Arduino UNO              | 1        | [[link](https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf)]|
| 2  | OLED display 0.96        | 4/6      | [[link](https://www.mouser.com/datasheet/2/1398/Soldered_333099-3395096.pdf?srsltid=AfmBOoqfmm8QoUOllGy6ovOIXSHeqZtmY5EUTcmRMYY_mUVvcQQgWZ8b)] |
| 3  | Buttons                  | 4/6      | N/A       |

### Block diagram
![image](https://github.com/user-attachments/assets/f14e48fe-eef5-4293-a3b2-4a7a3a3dc538)

### Circuit diagram
<img width="900" alt="Screenshot 2024-12-03 at 02 10 00" src="https://github.com/user-attachments/assets/fef912ea-c0c5-4249-b9b1-13b8d5b6e6f2">

https://wokwi.com/projects/416206453525866497

