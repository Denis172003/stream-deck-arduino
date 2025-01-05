import os
import subprocess
import time

# Set the path to your serial device (update this with the correct path)
serial_port = '/dev/tty.Bluetooth-Incoming-Port '

# Current volume level
current_volume = 0

def open_app(command):
    """Open applications based on command."""
    if command == "APP1":
        os.system("open -a TextEdit")  # Opens TextEdit (macOS equivalent of Notepad)
    elif command == "APP2":
        os.system("open -a Google\\ Chrome")  # Opens Google Chrome
    elif command == "APP3":
        os.system("open -a Calculator")  # Opens Calculator
    elif command == "APP4":
        os.system("open .")  # Opens Finder
    elif command == "APP5":
        os.system("open -a Terminal")  # Opens Terminal
    else:
        print(f"Unknown application command: {command}")

def adjust_volume(pot_value):
    """Adjust system volume based on potentiometer value."""
    global current_volume
    # Map potentiometer value to a percentage (0-100)
    volume = int((pot_value / 2046) * 100)
    
    # Log the potentiometer value and the mapped volume
    print(f"Potentiometer value: {pot_value}, Mapped volume: {volume}")
    
    # Set system volume using AppleScript
    subprocess.run(["osascript", "-e", f"set volume output volume {volume}"])
    
    # Update the current volume
    current_volume = volume
    print(f"Updated current volume: {current_volume}")

def process_serial_input(data):
    """Process incoming serial data from Arduino."""
    # Trim whitespace from data
    data = data.strip()
    print(f"Received data: {data}")
    
    if data.startswith("APP"):  # App launch command
        open_app(data)
    elif data.startswith("Volume:"):  # Volume control command
        try:
            pot_value = int(data.split(":")[1])
            adjust_volume(pot_value)
        except ValueError:
            print("Invalid potentiometer value received")
    else:
        print(f"Unknown command: {data}")

def read_serial_data():
    """Read data from the serial port using the `screen` command."""
    try:
        # Open the serial port in non-blocking mode using screen (macOS)
        with subprocess.Popen(
            ["screen", "-S", "serial_connection", serial_port, "115200"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            bufsize=1,
            universal_newlines=True
        ) as proc:
            while True:
                # Read a line of data from the serial port
                line = proc.stdout.readline()
                if line:
                    process_serial_input(line.strip())  # Process the incoming data
                time.sleep(0.1)
    except Exception as e:
        print(f"Error while reading serial data: {e}")

def main():
    """Main function to run the serial communication and process input."""
    read_serial_data()

if __name__ == "__main__":
    main()
