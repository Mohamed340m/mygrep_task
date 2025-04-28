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
Adding regex support would require removing -q from grep and implementing pattern validation. For -i (case-sensitive), -c (count), or -l (files-with-matches) options, we'd:

Add new flags in getopts

Create corresponding boolean variables

Modify output formatting logic

Development Challenges:
The most complex part was handling option combinations while maintaining proper argument validation. The initial syntax error (extra closing brace) demonstrates how subtle bash scripting errors can break entire functionality. Proper argument shifting after getopts and maintaining case-insensitive matching across both normal/inverted modes required careful testing.



