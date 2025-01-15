import serial
import os
import pyautogui
import time

# Open serial port (replace with your Arduino's port)
ser = serial.Serial('COM5', 9600)  # Adjust COM port as needed
time.sleep(2)  # Wait for the connection to establish
is_muted = False

current_volume = 0  # Track the current volume level

def open_app(command):
    """Open applications based on command."""
    if command == "APP1":
        os.system("notepad")  # Opens Notepad
    elif command == "APP3":
        os.system("calc")  # Opens Calculator
    elif command == "APP4":
        os.system("start cmd")  # Opens Command Prompt
    elif command == "APP5":
        os.system("start explorer")  # Opens File Explorer
    elif command == "APP6":
        os.system("start chrome")  # Opens Chrome
    else:
        print(f"Unknown application command: {command}")

def adjust_volume(pot_value):
    """Adjust system volume based on potentiometer value."""
    global current_volume
    # Map potentiometer value to a percentage (0-100)
    volume = int((pot_value / 2046) * 1000)
    
    # Log the potentiometer value and the mapped volume
    print(f"Potentiometer value: {pot_value}, Mapped volume: {volume}")
    
    # Adjust the volume to the desired level
    if volume > current_volume:
        pyautogui.press('volumeup', presses=(volume - current_volume))
        print(f"Increasing volume to {volume}")
    elif volume < current_volume:
        pyautogui.press('volumedown', presses=(current_volume - volume))
        print(f"Decreasing volume to {volume}")

    # Update the current volume
    current_volume = volume
    print(f"Updated current volume: {current_volume}")

def process_serial_input(data):
    """Process incoming serial data from Arduino."""
    global is_muted  # Declare the variable as global to modify it
    # Trim whitespace from data
    data = data.strip()
    print(f"Received data: {data}")
    
    if data.startswith("APP"):  # App launch command
        open_app(data)
    elif data.startswith("Volume:"):  # Volume control command
        is_muted = False  # Unmute the volume
        try:
            pot_value = int(data.split(":")[1])
            adjust_volume(pot_value)
        except ValueError:
            print("Invalid potentiometer value received")
    elif data == "MUTE":
        if is_muted:
            print("Unmuting...")
            pyautogui.press('volumemute')
            is_muted = False
        else:
            print("Muting...")
            pyautogui.press('volumemute')
            is_muted = True
    else:
        print(f"Unknown command: {data}")

def main():
    while True:
        if ser.in_waiting > 0:
            data = ser.readline().decode('utf-8').strip()
            process_serial_input(data)

if __name__ == "__main__":
    main()
