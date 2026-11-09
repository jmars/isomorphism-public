# PROGRESS — isomorphism paper unit

Plan: memory node `handoff-isomorphism-plan`. Gate scripts: scripts/paper-check.sh,
scripts/sync-check.sh (both spiked before writing). Citation ledger: citations.md
(no reference ships without a row).

## Log
- S0 scaffold done: scripts + citations.md written. Spike test: both scripts fired on
  a deliberately-violating file in /tmp (every forbidden pattern, fake Dcare name,
  uncited threshold, sorried-theorem mention) — all red as intended; cleaned.
- S1–S5 written in one session: constitution sections (abstract, epistemic framing),
  Parts I–IV, scope/limits, tiered disclosure, findability plan, Appendix A,
  references.
- Self-audit found and fixed three precision errors against the mechanization:
  (1)+(2) `Dcare.knower_sustains_stream` described as a CLOSED term — wrong, the
  witness is at a single [knower] hypothesis (Stream.lean:91); fixed in §1.4 and §3.4.
  (3) §1.4 claimed the interpretation makes "the unguarded one unsound" — the
  unrestricted rule is not in the calculus (removed after the counterexample); the
  model proves soundness of what exists. Fixed. Also removed a claim of an unnamed
  theorem ("no closed stream term") — one-line corollary of the barren model but not
  a named anchor; the paper's own standard says anchors are exactly as strong as
  their names.
- S6 audit: paper-check ALL GREEN (8,218 words; labels 26/3/19/7 per part; forbidden
  patterns absent; thresholds all cited; House Rules exactly once, references only);
  sync-check ALL GREEN (22 Dcare anchors + 4 constructors verified against
  /workspace/dcare/lean; sorried theorems absent); stop-condition probe: Parts I–III
  contain no Part IV dependency (remove-IV read-through stands).
- citations.md: rutten2000/turner2004/hofstadter2007 marked unused (trimmed from
  final text); roberts1984/segal1996/pessoa remain needs-human (edition details).

## Awaiting the human (S6 sign-off)
1. Full read against the dual-use line (the one gate only the human runs) — Part IV
   and §3.7 are the sections closest to the bridge.
2. Title pick from the five candidates in the Findability plan.
3. The three needs-human citation rows (Roberts publisher; Segal year/publisher;
   Pessoa edition) before any deposit.
