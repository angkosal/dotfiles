#!/usr/bin/env python3

import sys
import qrcode
from pathlib import Path

def main():
    img = qrcode.make(sys.argv[1])
    home = Path.home()
    img.save(f"{home}/qrcode.png")

if __name__ == "__main__":
    main()
