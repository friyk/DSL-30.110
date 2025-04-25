import os
import sys

def file_to_binary(input_path):
    # Get the output path with .e extension
    base_name = os.path.splitext(input_path)[0]
    output_path = base_name + '.e'

    try:
        with open(input_path, 'rb') as infile, open(output_path, 'w') as outfile:
            while byte := infile.read(1):
                binary_string = format(ord(byte), '08b')
                outfile.write(binary_string)
        print(f"Binary output written to: {output_path}")
    except FileNotFoundError:
        print(f"File not found: {input_path}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python file_to_binary.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    file_to_binary(input_file)
