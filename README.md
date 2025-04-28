# Custom `grep`: `mygrep.sh`

## 📜 Task
Build a mini version of `grep` supporting:
- Case-insensitive search
- `-n` Show line numbers
- `-v` Invert match
- Combined options (-vn)

---

## 🛠️ How my script handles arguments and options

- Parses any combination of options first (using `while` loop and `case`).
- After options, expects exactly **two arguments**: the **search string** and the **file**.
- Validates if file exists.
- Line-by-line reads, applies search/invert logic, and conditionally adds line numbers.

---

## 📸 Hands-On Validation

Tested with `testfile.txt`


Screenshots included:
- `./mygrep.sh hello testfile.txt`
- `./mygrep.sh -n hello testfile.txt`
- `./mygrep.sh -vn hello testfile.txt`
- `./mygrep.sh -v testfile.txt` (shows error due to missing search string)

---



