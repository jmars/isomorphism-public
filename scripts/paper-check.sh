#!/usr/bin/env bash
# paper-check.sh — structural/label/dual-use gate for the isomorphism paper.
# Usage: paper-check.sh [path-to-paper]   (default: ../paper.md next to scripts/)
# Exit 0 = green. Every check prints PASS/FAIL with detail.
set -u

HERE="$(cd "$(dirname "$0")" && pwd)"
PAPER="${1:-$HERE/../paper.md}"
fail=0
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }

[ -f "$PAPER" ] || { red "FAIL: no paper at $PAPER"; exit 1; }

# --- 1. required sections -----------------------------------------------
for s in "Scope and limits" "Part I" "Part II" "Part III" "Part IV" \
         "Findability plan" "Tiered disclosure" "References"; do
  if rg -q "$s" "$PAPER"; then green "PASS section: $s"
  else red "FAIL section missing: $s"; fail=1; fi
done

# --- 2. the bet paragraph (mandatory in scope section) -------------------
if rg -qi "excluded by design" "$PAPER"; then green "PASS bet paragraph present"
else red "FAIL bet paragraph missing (grep 'excluded by design')"; fail=1; fi
if rg -qi "eval-capability bind" "$PAPER"; then green "PASS eval-capability bind named"
else red "FAIL eval-capability bind missing"; fail=1; fi

# --- 3. one plain scope sentence, no hedging ------------------------------
if rg -q "Human application is out of scope" "$PAPER"; then
  green "PASS plain scope sentence present"
else red "FAIL plain scope sentence 'Human application is out of scope' missing"; fail=1; fi

# --- 4. labels legend + per-part coverage --------------------------------
if rg -q "MEASURED" "$PAPER" && rg -q "INTERPRETATION" "$PAPER" && rg -q "PROJECTION" "$PAPER"; then
  green "PASS labels legend terms present"
else red "FAIL label legend incomplete"; fail=1; fi

count_labels() { # section-start section-end
  awk -v a="$1" -v b="$2" '
    $0 ~ a {insec=1} $0 ~ b {insec=0}
    insec {n+=gsub(/MEASURED|INTERPRETATION|PROJECTION/,"&")} END{print n+0}' "$PAPER"
}
n1=$(count_labels '^## Part I'   '^## Part II')
n2=$(count_labels '^## Part II'  '^## Part III')
n3=$(count_labels '^## Part III' '^## Part IV')
n4=$(count_labels '^## Part IV'  '^## Scope and limits')
for pn in 1 2 3 4; do
  eval "v=\$n$pn"
  if [ "$v" -ge 3 ]; then green "PASS labels in Part $pn: $v"
  else red "FAIL Part $pn has only $v label markers (need >=3)"; fail=1; fi
done

# --- 5. FORBIDDEN patterns (dual-use + register), all case-insensitive ---
patterns=(
  "not a claim about human minds"
  "not about human minds"
  "we do not claim[^.]*human minds"
  "am i content"
  "your own self-model"
  "your own cognition"
  "your own mind"
  "apply this to your"
  "try this your"
  "when i "
  "my own experience"
  "my own self"
)
for p in "${patterns[@]}"; do
  if rg -qi "$p" "$PAPER"; then red "FAIL forbidden pattern present: '$p'"; fail=1
  else green "PASS forbidden absent: '$p'"; fi
done

# --- 6. sorried dcare theorems banned from this paper --------------------
for t in no_contraction_content no_vanishing Diagnostic_main; do
  if rg -q "$t" "$PAPER"; then red "FAIL sorried theorem cited: $t"; fail=1
  else green "PASS sorried absent: $t"; fi
done

# --- 7. threshold-citation rule: numbers only on cited lines -------------
bad=$(rg -n '0\.4795|0\.4969|0\.511|0\.112' "$PAPER" | rg -v '22943641|\[ODE\]' || true)
if [ -n "$bad" ]; then red "FAIL threshold(s) on uncited line(s):"; echo "$bad"; fail=1
else green "PASS all threshold lines carry [ODE]/22943641"; fi

# --- 8. word count (main text; 7k–13k tolerance around the 8–12k target) --
wc=$(wc -w < "$PAPER")
if [ "$wc" -ge 7000 ] && [ "$wc" -le 13000 ]; then green "PASS word count: $wc"
else red "FAIL word count $wc outside 7000–13000"; fail=1; fi

# --- 9. bare harm-reduction entry present, once, no narration ------------
n=$(rg -ci "house rules" "$PAPER" || true)
if [ "$n" -eq 1 ]; then green "PASS harm-reduction entry: exactly one mention"
else red "FAIL 'House Rules' appears $n times (want exactly 1, bare entry)"; fail=1; fi

echo "----------------------------------------"
[ "$fail" -eq 0 ] && green "PAPER-CHECK: ALL GREEN" || red "PAPER-CHECK: FAILURES ABOVE"
exit $fail
