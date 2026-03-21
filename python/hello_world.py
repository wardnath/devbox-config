#!/usr/bin/env python3
"""
Simple Hello World example in Python.

This demonstrates basic Python script structure and execution.
"""


def greet(name: str = "World") -> str:
    """Return a greeting message."""
    return f"Hello, {name}!"


def main():
    """Main function."""
    print(greet())
    print(greet("Devbox User"))

    # Show Python version
    import sys
    print(f"\nRunning Python {sys.version}")


if __name__ == "__main__":
    main()
