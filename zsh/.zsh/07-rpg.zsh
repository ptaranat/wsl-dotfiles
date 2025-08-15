#!/usr/bin/env bash
znap install matteocorti/roll
source ~[roll]/bash_completion/roll

# outputs avrae/d20 to glow
function dice() {
  if [ -n "$1" ]; then
    uv run --with d20 - <<EOF | glow -
from d20 import roll
print(str(roll('$1')))
EOF
  else
    echo "Missing statement"
  fi
}

function thaco() {
  if [ -n "$1" ]; then
    uv run --with d20 - <<EOF | glow -
from d20 import roll
print(str(roll('$1 [THAC0] - (d20 + ${2:-0})')) + 'AC')
EOF
  else
    echo "Missing THAC0"
  fi
}

function stats() {
  uv run --with d20 - <<EOF | glow -
from d20 import roll

statnames = ['[STR]','[DEX]','[CON]','[INT]','[WIS]','[CHA]']
for stat in statnames:
    result = roll("3d6")
    total = str(result.total)
    values = [[str(int(j)) for j in i.values][0] for i in result.expr.children[0].values]
    print(f"**{stat}** ({', '.join(values)}) \`{total}\`")
EOF
}
