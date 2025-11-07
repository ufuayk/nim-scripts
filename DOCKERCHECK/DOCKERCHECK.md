# DOCKERCHECK

Checks if Docker is installed and if the daemon is running. Outputs **only numeric exit codes**.

---

| Code | Meaning                                      |
| ---- | -------------------------------------------- |
| 0    | Docker binary not found.                     |
| 1    | Docker installed but not executable / broken.|
| 2    | Docker daemon not accessible / not running.  |
| 3    | Docker daemon running and accessible.        |

---

**Usage:**

```bash
./dockercheck
echo $?
```

---

Short and clean.. 🧹
