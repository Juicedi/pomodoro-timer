import terminal
import os

const pomodoroTime = 25
const shortBreak = 5
const longBreak = 10
const seconds = 59
const shortBreakState = 0
const pomodoroState = 1

var currentState = pomodoroState
var text = ""

proc countDownSeconds(minutes: int): void =
  var secondsPast = 0

  while true:
    if minutes < 10:
      text = "0" & $minutes & ":" 
    else:
      text = $minutes & ":" 

    if (seconds - secondsPast) < 10:
      text.add("0" & $(seconds - secondsPast))
    else:
      text.add($(seconds - secondsPast))

    setCursorXPos(0)
    stdout.write(text)
    sleep(1000)
    secondsPast += 1
    if (seconds - secondsPast) <= 0: break

proc countDownMinutes(minutes: int): void =
  for i in 0..(minutes - 1):
    countDownSeconds(minutes - i)

while true:
  if currentState == pomodoroState:
    echo "press any key to start pomodoro"
    discard getch()
    countDownMinutes(pomodoroTime)
    currentState = shortBreakState
  else:
    echo "press any key to start short break"
    discard getch()
    countDownMinutes(shortBreak)
    currentState = pomodoroState
