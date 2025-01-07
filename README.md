# Stream Deck with Arduino Uno

## Introduction

**Project Name**: Stream Deck

This project is based on the development of a custom stream deck using two breadboards, 4/6 displays with 3D-printed enclosures, 4/6 buttons for each display, and an Arduino Uno.  

### What does it do?  
The device allows the user to quickly interact with various applications or functions by pressing buttons. Each display, mounted on a button, shows a representative image for the assigned function. Pressing it opens the corresponding application or executes the configured command (for example, a button with a Google Meet image opens the corresponding application).  

### Purpose  
The purpose of the project is to create an accessible and customizable device that simplifies users' workflow for activities such as streaming, virtual meetings, or other daily processes.  

### Initial Idea  
I wanted an alternative solution to commercial stream decks that would be more accessible, using available and easy-to-integrate components.  

### Why is it useful?  
This project automates various processes and increases user efficiency, allowing quick access to different functions. It is easy to use, convenient, and time-saving, making interaction with the computer faster and more intuitive. By creating this project, I have learned more about electronics, programming, and 3D design.  

---

## General Description

The project is divided into hardware and software modules that work together to achieve the desired functionality.  

### Block Diagram

1. **Arduino Uno**  
   - The main controller that interprets button commands and controls the displays.  

2. **Breadboards**  
   - Support for connecting hardware components.  

3. **Buttons with displays mounted in 3D-printed enclosures**  
   - Each button is covered by a display that shows a representative image. The display is mounted in a 3D-printed enclosure that positions it above the button. Pressing the button sends a command to the Arduino to execute the specified function.  

4. **Electrical Connections**  
   - Wires for power and communication between components.  

### Interaction Between Modules  
- When a button is pressed, the signal is sent to the Arduino, which recognizes the command, triggers the associated function (e.g., opening an application on the PC), and updates the display if necessary.  

This modular structure allows for the addition of extra buttons and functions.  

---

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

---

### Pin Description for Each Component

#### 1. Displays (4/6 units)
- **Pins used:** A4, A5
- **Reason:** Data transmition pin (SDA) and Clock pin (SCL) are used to control the display segments. Each segment requires a pin to turn on or off, allowing the display of numbers.

#### 2. Buttons (4/6 units)
- **Pins used:** 13, 12, 11, 10, 9, 8
- **Reason:** Each button has a dedicated digital pin to detect state changes (pressed or not), enabling user interaction.

#### 3. Arduino Uno
- **Pins used:** Digital pins 8 - 13, GND, and 5V
- **Reason:** Arduino acts as the control unit, receiving input from buttons and sending output to displays. GND and 5V power external components.

---

### Circuit diagram
<img width="900" alt="Screenshot 2024-12-03 at 02 10 00" src="https://github.com/user-attachments/assets/fef912ea-c0c5-4249-b9b1-13b8d5b6e6f2">

https://wokwi.com/projects/416206453525866497

![image](https://github.com/user-attachments/assets/9aeaf20e-022d-4963-aba6-611689713359)

![stream-deck-arduino](https://github.com/user-attachments/assets/e2eec8bd-83e1-48e8-b336-7503c0d497f7)



