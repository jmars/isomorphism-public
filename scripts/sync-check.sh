#!/usr/bin/env bash
# sync-check.sh — every Dcare.* name in the paper matches a real declaration
# in the mechanization sources (default ~/coglib/lean, override with LEAN_DIR),
# and every Typed./Term./Ty. constructor matches a real constructor/def.
#
# An anchor whose DECLARING FILE is absent from the checkout is reported as a
# SKIP, never as a PASS: it is counted separately and printed in the summary.
# A skip is only for a file the checkout does not carry; if the file is present
# and the declaration is missing, that is a FAIL. See ANCHOR_FILE below.
# Exit 0 = no failures (skips do not fail the gate, and are never silent).
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
PAPER="${1:-$HERE/../paper.md}"
LEAN="${LEAN_DIR:-$HOME/coglib/lean}"
fail=0
pass=0
skip=0
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }
yellow(){ printf '\033[33m%s\033[0m\n' "$*"; }

[ -f "$PAPER" ] || { red "FAIL: no paper at $PAPER"; exit 1; }

# Anchors whose declaring file is not always in the checkout: name -> file.
# Dcare.reduce_at is declared in Chase.lean, which exists only on coglib branch
# wip-chase (6e33ef0) and not on main (189c9f0). Absent file => SKIP, loudly.
declare -A ANCHOR_FILE=(
  [reduce_at]=Chase.lean
)

# Dcare.<name> — must be a top-level theorem/def/class/structure/inductive
names=$(rg -o 'Dcare\.[A-Za-z_][A-Za-z0-9_]*' "$PAPER" -r '$0' | sort -u | sed 's/^Dcare\.//')
if [ -z "$names" ]; then red "FAIL: no Dcare.* citations found"; exit 1; fi
while IFS= read -r n; do
  [ -z "$n" ] && continue
  if rg -q "^(theorem|def|class|structure|inductive) $n\b" "$LEAN"/Dcare/*.lean; then
    green "PASS Dcare.$n"; pass=$((pass+1))
  elif [ -n "${ANCHOR_FILE[$n]:-}" ] && [ ! -f "$LEAN/Dcare/${ANCHOR_FILE[$n]}" ]; then
    yellow "SKIP Dcare.$n — ${ANCHOR_FILE[$n]} is not in this checkout (coglib branch wip-chase)"
    skip=$((skip+1))
  else
    red "FAIL Dcare.$n — no such declaration in $LEAN/Dcare/*.lean"; fail=1
  fi
done <<< "$names"

# Typed./Term./Ty. constructors — must exist as a constructor or def
ctors=$(rg -o '(Typed|Term|Ty)\.[a-z][A-Za-z0-9_]*' "$PAPER" | sort -u)
while IFS= read -r c; do
  [ -z "$c" ] && continue
  base="${c%%.*}"; nm="${c#*.}"
  if rg -q "\| $nm\b" "$LEAN"/Dcare/*.lean || rg -q "^(def|inductive) $nm\b" "$LEAN"/Dcare/*.lean; then
    green "PASS constructor $c"; pass=$((pass+1))
  else
    red "FAIL constructor $c not found in dcare sources"; fail=1
  fi
done <<< "$ctors"

echo "----------------------------------------"
if [ "$fail" -ne 0 ]; then
  red "SYNC-CHECK: $pass pass, $skip skipped, FAILURES ABOVE"
  [ "$skip" -gt 0 ] && yellow "NOTE: $skip anchor(s) SKIPPED — unverified, not passed"
elif [ "$skip" -gt 0 ]; then
  yellow "SYNC-CHECK: $pass pass, $skip skipped, 0 fail"
  yellow "NOTE: $skip anchor(s) SKIPPED — unverified, not passed"
else
  green "SYNC-CHECK: $pass pass, 0 skipped, ALL GREEN"
fi
exit $fail
