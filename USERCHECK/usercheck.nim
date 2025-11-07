import os, posix

var exitCode: int

try:
  let uid = getuid()

  if uid == 0:
    exitCode = 1
  elif uid > 0:
    exitCode = 2
  else:
    exitCode = 0

except:
  exitCode = 0

echo exitCode
quit(exitCode)
