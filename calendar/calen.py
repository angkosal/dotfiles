import sys
import calendar
from datetime import date


def main():
    year = date.today().year
    if len(sys.argv) > 1:
        year = int(sys.argv[1])
    x = calendar.TextCalendar()
    print(x.pryear(year))

if __name__ == "__main__":
    main()
