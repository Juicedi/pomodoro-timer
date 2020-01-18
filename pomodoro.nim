import terminal
import os
import progressbar

const minutes = [25, 5]
const texts = ["pomodoro", "short break"]

var arrayIndex = 0
var maxSeconds: int
var currentSeconds: int
var termWidth = terminalWidth()

proc twoDigit(number: int): string =
  if number < 10:
    result = "0" & $number
  else:
    result = $number

while true:
  echo "press any key to start " & texts[arrayIndex]
  discard getch()
  eraseScreen()
  setCursorYPos(0)

  for minutesLeft in countdown(minutes[arrayIndex] - 1, 0):
    for secondsLeft in countdown(59, 0):
      setCursorXPos(0)
      stdout.writeLine(twoDigit(minutesLeft) & ":" & twoDigit(secondsLeft))
      maxSeconds = minutes[arrayIndex] * 60
      currentSeconds = (minutesLeft * 60) + secondsLeft
      printProgress(maxSeconds - currentSeconds, maxSeconds)
      cursorUp(stdout)
      sleep(1000)
      if termWidth != terminalWidth():
        termWidth = terminalWidth()
        eraseScreen()
        setCursorYPos(0)

  arrayIndex = (arrayIndex + 1) mod 2
  echo ""
