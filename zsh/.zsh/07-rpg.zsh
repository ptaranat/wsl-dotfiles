znap install matteocorti/roll
source ~[roll]/bash_completion/roll

# outputs avrae/d20 to glow
function dice() {
  if [ -n "$1" ]; then
    local cmd
    cmd="from d20 import roll; print(str(roll('$1')))"
    python3 -c $cmd | glow -
  else
	echo "Missing statement"
  fi
}
