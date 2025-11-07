import osproc, os, posix

proc runSilent(cmd: string): int =
  let process = startProcess("/bin/sh",
    args = ["-c", cmd],
    options = {poUsePath}
  )
  let code = process.waitForExit()
  process.close()
  return code

var exitCode: int

let dockerPath = findExe("docker")
if dockerPath.len == 0 or not fileExists(dockerPath):
  exitCode = 0
else:
  let perms = getFilePermissions(dockerPath)
  if not (perms.contains(fpUserExec) or perms.contains(fpGroupExec) or perms.contains(fpOthersExec)):
    exitCode = 1
  elif runSilent("docker --version >/dev/null 2>&1") != 0:
    exitCode = 1
  elif runSilent("docker ps --format '{{.ID}}' >/dev/null 2>&1") != 0:
    exitCode = 2
  else:
    exitCode = 3

echo exitCode
quit(exitCode)
