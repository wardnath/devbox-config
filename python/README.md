# Python Examples

This directory contains Python example scripts for the devbox-config environment.

## Prerequisites

Python 3.13 is included in the devbox configuration. No additional setup required.

## Examples

### 1. Hello World (`hello_world.py`)

A simple example demonstrating basic Python script structure:

```bash
python python/hello_world.py
```

### 2. Utility Functions (`example_utils.py`)

A more comprehensive example showing:
- Running shell commands from Python
- Reading and parsing JSON files
- File system operations
- Directory analysis
- Type hints and documentation

```bash
python python/example_utils.py
```

## Running the Examples

Make the scripts executable (optional):
```bash
chmod +x python/*.py
```

Then run directly:
```bash
./python/hello_world.py
./python/example_utils.py
```

Or use Python interpreter:
```bash
python python/hello_world.py
python python/example_utils.py
```

## Using uv (included in devbox)

The devbox configuration includes `uv`, a fast Python package installer:

```bash
# Create a virtual environment
uv venv

# Activate it
source .venv/bin/activate

# Install packages
uv pip install requests pandas
```

## Writing Your Own Scripts

Feel free to add your own Python scripts to this directory. Follow these best practices:

1. Include a shebang line: `#!/usr/bin/env python3`
2. Add a module docstring
3. Use type hints for better code clarity
4. Add a `main()` function
5. Use `if __name__ == "__main__":` guard
