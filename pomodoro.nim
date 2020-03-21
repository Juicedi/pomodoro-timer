import terminal
import os
import progressbar
import audio

type State = enum
  pomodoro = 0,
  shortBreak = (1, "short break")

const minutes = [
  pomodoro: 25,
  shortBreak: 5
]

var running = true
var curState = pomodoro
var maxSeconds: int
var currentSeconds: int
var termWidth = terminalWidth()

proc twoDigit(number: int): string =
  if number < 10:
    result = "0" & $number
  else:
    result = $number

while running == true:
  echo "press any key to start " & $curState
  discard getch()
  eraseScreen()
  setCursorPos(0, 0)

  for minutesLeft in countdown(minutes[curState] - 1, 0):
    for secondsLeft in countdown(59, 0):
      setCursorXPos(0)
      stdout.writeLine(twoDigit(minutesLeft) & ":" & twoDigit(secondsLeft))
      maxSeconds = minutes[curState] * 60
      currentSeconds = (minutesLeft * 60) + secondsLeft
      printProgress(maxSeconds - currentSeconds, maxSeconds)
      setCursorPos(0, 0)
      sleep(1000)
      if termWidth != terminalWidth():
        termWidth = terminalWidth()
        eraseScreen()
        setCursorPos(0, 0)

  curState = State((curState.ord + 1) mod 2)
  playSound()
