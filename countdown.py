#!/usr/bin/env python
import time

countdowninfo = [i.strip().split("=") for i in open(".countdowns").readlines()]

now = time.time()
for i in range(0, len(countdowninfo)):
  then = time.mktime(time.strptime(countdowninfo[i][1],"%d %b %Y"))
  diff = (then - now) / 3600 / 24
  print("{} days until {}".format(diff, countdowninfo[i][0]) )

