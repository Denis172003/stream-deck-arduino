# Stream Deck with Arduino Uno

## Introduction

**Project Name**: Stream Deck

This project is based on the development of a custom stream deck using two breadboards, 6 displays with 3D-printed enclosures, 5 buttons for each display, a multiplexor and an Arduino Uno.  

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

4. **Multiplexer (TCA9548A)**  
   - Expands the number of I2C devices that can be connected.  
   - Allows the Arduino to control multiple displays by enabling communication with one display at a time.  

5. **Potentiometer**  
   - Adjusts the computer’s volume.  
   - Provides an analog input to the Arduino, which then translates it into volume control commands for the computer.    

6. **Electrical Connections**  
   - Wires for power and communication between components.
     
![image](https://github.com/user-attachments/assets/c41dbc2f-dc8c-4e62-a33d-29b5267dd0df)

### Interaction Between Modules  
- When a button is pressed, the signal is sent to the Arduino, which recognizes the command, triggers the associated function (e.g., opening an application on the PC), and updates the display if necessary.  

This modular structure allows for the addition of extra buttons and functions.  

---

## Detailed Description of Hardware Functionality

### 1. Modules and Components

**Microcontroller**: 
Arduino UNO serves as the central processing unit, managing inputs, outputs, and communication between connected components.

**Buttons with Displays**: 
The system includes 6 buttons, each paired with a 0.96-inch OLED display. Each display is housed in a 3D-printed case, which aligns it with the button. When pressed, the button sends a signal to the Arduino, which processes the action and updates the display, if required.

**OLED Displays**: 
6 0.96-inch OLED displays are connected to the Arduino using the I2C communication protocol. Each display shows a unique symbol or text that represents the associated button’s function.

**Multiplexer (TCA9548A)**:  
Since the I2C protocol can only handle a limited number of devices, a multiplexer is used to expand the number of connected OLED displays. It allows the Arduino to control multiple displays by enabling communication with one display at a time.  

**Potentiometer**:  
A potentiometer is included to control the computer’s volume. It provides an analog input to the Arduino, which interprets it and sends corresponding volume control commands to the computer.  

**Breadboards**: 
Used to interconnect components without soldering. This setup allows for easy testing and adjustments.

**Electrical Connections**: 
Standard jumper wires are used to establish communication and power connections between components.

### 2. Interfaces and Communication

**Button-to-Microcontroller (Input)**:  
Each button is connected to a digital input pin on the Arduino. The press of a button changes the signal state from HIGH to LOW, triggering an interrupt or a polling mechanism in the Arduino firmware.  

**Multiplexer-to-Display**:  
The multiplexer (TCA9548A) allows the Arduino to control multiple displays by selecting one at a time. It is connected via I2C and switches between the connected OLED displays, enabling communication with a specific display.  

**Microcontroller-to-Multiplexer**:  
The Arduino communicates with the multiplexer through I2C. It sends commands to enable specific channels on the multiplexer, allowing the communication with the corresponding OLED display.  

**Potentiometer-to-Microcontroller (Input)**:  
The potentiometer is connected to an analog input pin on the Arduino. It provides a variable voltage, which the Arduino reads to adjust the computer’s volume.  

**Microcontroller-to-Computer**:  
The Arduino communicates with the computer via USB. It sends volume control or button press signals to the computer, which are mapped to corresponding actions through software.  

### 3. Power Supply and Energy Consumption

**Power Source**: 
The system can be powered via USB (5V) or through an external power supply (7-12V) connected to the Arduino’s barrel jack.

**Energy Consumption**:
- **Arduino UNO**: Consumes approximately 50mA during standard operation.
- **OLED Displays**: Each display consumes approximately 20-30mA.
- **Buttons and Potentiometer**: Minimal power consumption as they act as simple switches with negligible current draw.

**Total Consumption**: 
Assuming the use of 6 OLED displays, the total power consumption is estimated as:
- **Arduino**: 50mA
- **6 OLED Displays**: 6 × 30mA = 180mA
- **Buttons**: Negligible
- **Potentiometer**: Negligible

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

---

# Bill of Material

| #  | Name                     | Quantity | Datasheet |
|----|--------------------------|----------|-----------|
| 1  | Arduino UNO              | 1        | [[link](https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf)]|
| 2  | OLED display 0.96        | 6      | [[link](https://www.mouser.com/datasheet/2/1398/Soldered_333099-3395096.pdf?srsltid=AfmBOoqfmm8QoUOllGy6ovOIXSHeqZtmY5EUTcmRMYY_mUVvcQQgWZ8b)] |
| 3  | Buttons                  | 6      | [[link](https://components101.com/switches/push-button)]      |
| 4  | Potentiometer            | 1      | N/A       |
| 5  | Multiplexor              | 1      | [[link](https://www.ti.com/lit/ds/symlink/tca9548a.pdf)]      |

---

### Pin Description for Each Component

#### 1. Arduino Uno
- **Pins used:** Digital pins 8 - 13, GND, and 5V
- **Reason:** Arduino acts as the control unit, receiving input from buttons and sending output to displays. GND and 5V power external components.
  
![image](https://github.com/user-attachments/assets/6c2fa9e6-c71b-467b-9f4f-054493a9469d)

#### 2. Displays (6 units)
- **Pins used:** A4, A5
- **Reason:** Data transmition pin (SDA) and Clock pin (SCL) are used to control the display segments. Each segment requires a pin to turn on or off, allowing the display of numbers.
  
![image](https://github.com/user-attachments/assets/43cd9dd2-5bdf-4ee3-aec3-1672b1fa6118)


#### 3. Buttons (5 units)
- **Pins used:** 13, 12, 11, 10, 9, 8
- **Reason:** Each button has a dedicated digital pin to detect state changes (pressed or not), enabling user interaction.
![image-removebg-preview (1)](https://github.com/user-attachments/assets/5ff1ccd8-e597-4f1d-9c15-7a5d8cdea6d0)


### 4. Potentiometer (1 unit)
- **Pins used:** A0 (Analog Input), GND, and 5V
- **Reason:** The potentiometer is used for volume adjustment. The analog input (A0) reads the varying voltage, which corresponds to the desired volume level. This value can then be processed to control the audio output.
![image-removebg-preview (2)](https://github.com/user-attachments/assets/6fdd27ff-1ae4-4d2a-b66f-d3b174c55f5d)

#### 5. Multiplexer (TCA9548A)  
- **Pins used:** SDA, SCL, and control pins (usually 0-7)  
- **Reason:** The multiplexer allows the Arduino to control multiple I2C devices (displays) by switching between them. SDA and SCL are used for I2C communication with the Arduino. The control pins select which display is active at a given time.
![image-removebg-preview (3)](https://github.com/user-attachments/assets/39b9b877-8e57-4cac-a69a-7a280cc22359)
---
### Choice of Libraries 📚:

#### Arduino Libraries:

- **Wire.h**: Essential for I2C communication between the Arduino, multiplexer, and OLED displays.
- **Adafruit_GFX.h & Adafruit_SSD1306.h**: Provide easy-to-use functions for rendering graphics and text on OLED displays.

#### Python Libraries:

- **os**: Manages application launches directly from the system.
- **subprocess**: Executes macOS-specific commands like adjusting volume.
- **time**: Ensures smooth synchronization between components.

---
**Novelty of the Project**  

This project offers a budget-friendly, custom stream deck with real-time visual feedback on multiple OLED displays. Its key features include:  

- **Customizable Buttons**: Users can assign specific actions to each button, such as launching applications or controlling basic system settings.  
- **Simple, Scalable Design**: The setup can support multiple OLED screens without requiring advanced hardware, making it accessible for DIY enthusiasts.  
- **Improved Workflow Efficiency**: By automating common tasks, it helps users save time and stay organized.  

The project strikes a balance between affordability, functionality, and ease of use, making it a practical tool for personal or hobbyist applications.
---

### Circuit diagram
<img width="900" alt="Screenshot 2024-12-03 at 02 10 00" src="https://github.com/user-attachments/assets/fef912ea-c0c5-4249-b9b1-13b8d5b6e6f2">

https://wokwi.com/projects/416206453525866497

![image](https://github.com/user-attachments/assets/9aeaf20e-022d-4963-aba6-611689713359)

![stream-deck-arduino](https://github.com/user-attachments/assets/e2eec8bd-83e1-48e8-b336-7503c0d497f7)



https://github.com/user-attachments/assets/20e77c98-b352-4aff-852b-f2bc883c0401




