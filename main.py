import subprocess
import sys

def main():
    try:
        subprocess.run(['./init.sh'])
    # Handle Ctrl+C
    except KeyboardInterrupt:
        print("\nGoodbye!")
        sys.exit(0)

if __name__ == "__main__":
    main()