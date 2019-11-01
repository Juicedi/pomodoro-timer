import terminal
import os

const minutes = [25, 5]
const texts = ["pomodoro", "short break"]

var arrayIndex = 0

proc twoDigit(number: int): string =
  if number < 10:
    result = "0" & $number
  else:
    result = $number

while true:
  echo "press any key to start " & texts[arrayIndex]
  discard getch()

  for minutesLeft in countdown(minutes[arrayIndex] - 1, 0):
    for secondsLeft in countdown(59, 0):
      setCursorXPos(0)
      stdout.write(twoDigit(minutesLeft) & ":" & twoDigit(secondsLeft))
      sleep(1000)

  arrayIndex = (arrayIndex + 1) mod 2
  echo ""
