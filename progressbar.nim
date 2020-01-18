import terminal
import os
import math

var tWidth: int
var line: string
var blocks: int

proc printProgress*(current: int, max: int): void =
  tWidth = terminalWidth()
  blocks = int(round((current / max) * tWidth.float()))

  for a in 0..tWidth - 1:
    if a == 0: line.add("[")
    elif a == tWidth - 1: line.add("]")
    elif a <= blocks: line.add("#")
    else: line.add("-")

  setCursorXPos(0)
  stdout.write(line)
  line = ""
