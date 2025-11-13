import osproc, os, strutils, streams

proc runSilent(cmd: string): string =
  let p = startProcess("/bin/sh", args = ["-c", cmd], options = {poUsePath, poStdErrToStdOut})
  var output = ""
  if p.outputStream != nil:
    output = p.outputStream.readAll().strip().toLowerAscii()
  discard p.waitForExit()
  p.close()
  return output

var exitCode = 0
var ntpStatus = ""

when defined(linux):
  ntpStatus = runSilent("timedatectl show -p NTPSynchronized 2>/dev/null | cut -d= -f2")
elif defined(macosx):
  ntpStatus = runSilent("systemsetup -getnetworktimeserver 2>/dev/null | grep -v 'not set' || true")
else:
  ntpStatus = ""

if ntpStatus.contains("yes") or ntpStatus.contains("true"):
  exitCode = 1
else:
  exitCode = 0

echo exitCode
quit(exitCode)
