# Usage function to show error messages
usage() {
  echo "Usage: $0 [-n] [-v] <search_string> <file>"
  exit 1
}

# Initialize option flags
show_line_numbers=0
invert_match=0

# Parse options -n and -v (can be combined)
while getopts ":nv" opt; do
  case $opt in
    n) show_line_numbers=1 ;;
    v) invert_match=1 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage ;;
  esac
done

# Shift parsed options away
shift $((OPTIND -1))

# Argument validation
if [ "$invert_match" -eq 1 ]; then
  # For -v, search string and file are still required
  if [ $# -lt 2 ]; then
    echo "Error: missing search string or file" >&2
    usage
  fi
else
  # Without -v, need search string and file
  if [ $# -lt 2 ]; then
    echo "Error: missing search string or file" >&2
    usage
  fi
fi

search=$1
file=$2

# Check file existence
if [ ! -f "$file" ]; then
  echo "mygrep.sh: $file: No such file or directory" >&2
  exit 2
fi

# Read file line by line and process
line_num=0
while IFS= read -r line || [ -n "$line" ]; do
  line_num=$((line_num + 1))
  # Case-insensitive match check
  if echo "$line" | grep -iq -- "$search"; then
    matched=1
  else
    matched=0
  fi

  # Apply invert match if needed
  if [ "$invert_match" -eq 1 ]; then
    matched=$((1 - matched))
  fi

  if [ "$matched" -eq 1 ]; then
    if [ "$show_line_numbers" -eq 1 ]; then
      echo "${line_num}:$line"
    else
      echo "$line"
    fi
  fi
done < "$file"
