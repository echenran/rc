#!/usr/bin/env python
import time

try:
  countdowninfo = [i.strip().split("=") for i in open(".countdowns").readlines()]
except Exception:
  print("Countdown file is empty or something went amok :(")
  import sys;sys.exit(1)

if len(countdowninfo[0])==1:
  print("No countdowns. Add one with 'cdown -a [name] [day month year]'!")
  import sys;sys.exit(1)

now = time.time()
for i in range(0, len(countdowninfo)):
  then = time.mktime(time.strptime(countdowninfo[i][1],"%d %b %Y"))
  diff = (then - now) / 3600 / 24
  print("{} days until {}".format(diff, countdowninfo[i][0]) )

