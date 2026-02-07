#!/usr/bin/env python3
from hijri_converter import Gregorian

from datetime import date
today = date.today()

hijri = Gregorian(today.year, today.month, today.day).to_hijri()

print(f"{hijri.day} {hijri.month_name('ar')} {hijri.year}")
