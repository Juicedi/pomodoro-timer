import terminal
import os
import progressbar

const pomodoro = [
  (minutes: 25, text: "pomodoro"),
  (minutes: 5, text: "short break")
]

var running = true
var arrayIndex: int
var maxSeconds: int
var currentSeconds: int
var termWidth = terminalWidth()

proc twoDigit(number: int): string =
  if number < 10:
    result = "0" & $number
  else:
    result = $number

while running == true:
  echo "press any key to start " & pomodoro[arrayIndex].text
  discard getch()
  eraseScreen()
  setCursorPos(0, 0)

  for minutesLeft in countdown(pomodoro[arrayIndex].minutes - 1, 0):
    for secondsLeft in countdown(59, 0):
      setCursorXPos(0)
      stdout.writeLine(twoDigit(minutesLeft) & ":" & twoDigit(secondsLeft))
      maxSeconds = pomodoro[arrayIndex].minutes * 60
      currentSeconds = (minutesLeft * 60) + secondsLeft
      printProgress(maxSeconds - currentSeconds, maxSeconds)
      cursorUp(stdout)
      sleep(1000)
      if termWidth != terminalWidth():
        termWidth = terminalWidth()
        eraseScreen()
        setCursorPos(0, 0)

  arrayIndex = (arrayIndex + 1) mod 2
  echo ""
