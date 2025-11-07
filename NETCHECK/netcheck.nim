import osproc, os

proc runSilent(cmd: string): int =
  let p = startProcess("/bin/sh", args = ["-c", cmd], options = {poUsePath})
  let code = p.waitForExit()
  p.close()
  return code

var exitCode: int

let netStatus = runSilent("ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1")

if netStatus == 0:
  exitCode = 1
else:
  exitCode = 0

echo exitCode
quit(exitCode)
