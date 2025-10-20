#!/usr/bin/env python3
"""
Example Python utilities for devbox-config environment.

This script demonstrates various Python capabilities and patterns
useful in a development environment.
"""

import json
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Optional


def run_command(cmd: List[str]) -> Dict[str, any]:
    """
    Execute a shell command and return results.

    Args:
        cmd: Command as list of strings

    Returns:
        Dict with stdout, stderr, and return code
    """
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30
        )
        return {
            "stdout": result.stdout,
            "stderr": result.stderr,
            "returncode": result.returncode,
            "success": result.returncode == 0
        }
    except subprocess.TimeoutExpired:
        return {
            "stdout": "",
            "stderr": "Command timed out",
            "returncode": -1,
            "success": False
        }
    except Exception as e:
        return {
            "stdout": "",
            "stderr": str(e),
            "returncode": -1,
            "success": False
        }


def check_devbox_packages() -> List[Dict[str, str]]:
    """
    Read devbox.json and list installed packages.

    Returns:
        List of package information dictionaries
    """
    devbox_json = Path(__file__).parent.parent / "devbox.json"

    if not devbox_json.exists():
        print(f"Error: {devbox_json} not found", file=sys.stderr)
        return []

    with open(devbox_json, 'r') as f:
        config = json.load(f)

    packages = config.get("packages", [])
    return [{"name": pkg.split("@")[0], "version": pkg.split("@")[1] if "@" in pkg else "latest"}
            for pkg in packages]


def find_files(directory: Path, pattern: str = "*") -> List[Path]:
    """
    Recursively find files matching a pattern.

    Args:
        directory: Directory to search
        pattern: Glob pattern to match

    Returns:
        List of matching file paths
    """
    return list(Path(directory).rglob(pattern))


def format_size(bytes: int) -> str:
    """
    Format bytes to human-readable size.

    Args:
        bytes: Size in bytes

    Returns:
        Formatted string (e.g., "1.5 MB")
    """
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if bytes < 1024.0:
            return f"{bytes:.1f} {unit}"
        bytes /= 1024.0
    return f"{bytes:.1f} PB"


def analyze_directory(path: str = ".") -> Dict[str, any]:
    """
    Analyze a directory and return statistics.

    Args:
        path: Directory path to analyze

    Returns:
        Dictionary with directory statistics
    """
    directory = Path(path)

    if not directory.exists():
        return {"error": "Directory does not exist"}

    files = list(directory.rglob("*"))
    total_size = sum(f.stat().st_size for f in files if f.is_file())

    extensions = {}
    for f in files:
        if f.is_file():
            ext = f.suffix or "no_extension"
            extensions[ext] = extensions.get(ext, 0) + 1

    return {
        "path": str(directory.absolute()),
        "total_files": len([f for f in files if f.is_file()]),
        "total_dirs": len([f for f in files if f.is_dir()]),
        "total_size": format_size(total_size),
        "file_types": extensions
    }


def main():
    """Main function demonstrating the utilities."""
    print("=== Devbox Configuration Python Example ===\n")

    # Example 1: Check devbox packages
    print("1. Installed Devbox Packages:")
    packages = check_devbox_packages()
    for pkg in packages[:5]:  # Show first 5
        print(f"   - {pkg['name']} ({pkg['version']})")
    if len(packages) > 5:
        print(f"   ... and {len(packages) - 5} more packages")
    print()

    # Example 2: Run a simple command
    print("2. System Information:")
    result = run_command(["python", "--version"])
    if result["success"]:
        print(f"   {result['stdout'].strip()}")
    print()

    # Example 3: Analyze current directory
    print("3. Directory Analysis (python/):")
    stats = analyze_directory("python")
    if "error" not in stats:
        print(f"   Total files: {stats['total_files']}")
        print(f"   Total size: {stats['total_size']}")
    print()

    # Example 4: Find Python files
    print("4. Finding Python files:")
    py_files = find_files(Path(__file__).parent.parent, "*.py")
    for py_file in py_files:
        print(f"   - {py_file}")
    print()

    print("=== Example Complete ===")


if __name__ == "__main__":
    main()
