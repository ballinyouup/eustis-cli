import subprocess
import sys
from pathlib import Path

def main():
    try:
        repo_dir = Path(__file__).resolve().parent
        init_script = repo_dir / 'init.sh'
        subprocess.run([str(init_script)], cwd=str(repo_dir))
    # Handle Ctrl+C
    except KeyboardInterrupt:
        print("\nGoodbye!")
        sys.exit(0)

if __name__ == "__main__":
    main()