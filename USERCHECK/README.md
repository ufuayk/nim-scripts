# USERCHECK

Checks if the script is running as root or normal user and returns only numeric exit codes.

---

| Code | Meaning                                      |
| ---- | -------------------------------------------- |
| 0    | Cannot determine.                            |
| 1    | Running as root.                             |
| 2    | Running as user.                             |

---

**Usage:**

```bash
./usercheck
echo $?
```

---

Short and clean.. 🧹
