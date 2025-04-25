import serial
import signal
import sys

# Configuration
COM_PORT = 'COM8'
BAUD_RATE = 1000000
OUTPUT_FILE = 'serial_dump.bin'

# Flag to signal graceful shutdown
running = True

def signal_handler(sig, frame):
    global running
    print("\nCtrl-C received. Shutting down...")
    running = False

def main():
    global running

    # Register the signal handler for Ctrl-C
    signal.signal(signal.SIGINT, signal_handler)

    try:
        # Open the serial port
        with serial.Serial(COM_PORT, BAUD_RATE, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE) as ser:
            print(f"Connected to {COM_PORT} at {BAUD_RATE} baud. Writing to {OUTPUT_FILE}...")
            with open(OUTPUT_FILE, 'wb') as f:
                while running:
                    if ser.in_waiting:
                        data = ser.read(ser.in_waiting)
                        f.write(data)
    except serial.SerialException as e:
        print(f"Serial error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")
    finally:
        print("Serial logging stopped.")

if __name__ == '__main__':
    main()
