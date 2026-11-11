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
- Citation/references verification pass (implementer, 2026-11-09; offline, internal knowledge
  only). CHANGED — paper.md References only: Howard 1980 book title completed ("To H. B.
  Curry: Essays on Combinatory Logic, Lambda Calculus and Formalism", eds. Seldin &
  Hindley); Birkedal et al. fourth author corrected Kristoffersen → Støvring; Nietzsche
  translation publisher added (Vintage Books); [ODE] now defined at the Armed Configuration
  entry ("cited throughout as [ODE]", = Zenodo 22943641). citations.md: same author fix;
  segal1996 promoted to verified (Blue Dove Press, 1996); roberts1984 and pessoa stay
  needs-human with the specific doubt recorded; new row care-derived (the References entry
  had no row — 1:1 restored); "Verification notes" section added (incl. Nietzsche §125 quote
  check). FINDINGS (not fixed — outside the References-only edit scope): (a) the four-state
  taxonomy is cited twice as "[MEASURED — prior artifact]" with no title and has no
  References entry and no row — the only body→References gap; needs a titled artifact
  entry (human supplies title/DOI) or a body reword; (b) five program artifacts ship in
  References but are never named in the body: common-source, dissolution-exit, not-free,
  terminates, care-derived (care-derived was also row-less). House Rules is unused by
  design (ledger #12) and is the one ledgered exception. Quote fidelity: the two §125 spans
  match Kaufmann as remembered, the ellipsis replaces "Are we not straying as through an
  infinite nothing?"; no wording changed, no phrase flagged suspect; physical-text check is
  the human's. Awaiting-list item 3 now has TWO needs-human rows (Roberts, Pessoa), not
  three. GATES (once, at the end): paper-check ALL GREEN (8,240 words, thresholds cited,
  House Rules exactly once); sync-check ALL GREEN (22 Dcare anchors + 4 constructors).
- Network pass (same session, 2026-11-09; the brief said offline — the USER authorized
  network, so this is on their instruction, not the brief). Sources: Crossref, OpenLibrary
  search + editions APIs, Zenodo records API, blog.jaye.ch index, published reproductions
  of Kaufmann's §125. CORRECTIONS THAT MATTER: (a) lindahl2017 was WRONG — PLoS ONE
  **12(5): e0176239**, not 12(3): e0173000 (that DOI is an unrelated CYFIP1/NOTCH1 genetics
  paper); fixed in paper + row. (b) Zenodo 22943641 is a CONCEPT DOI resolving to record
  23136326, *Self-Application as the Common Source of Benefit and Failure: A
  Control-Theoretic Model of Self-Regulation, Its Escapes, and a Standing-Cost Budget* —
  the program name *The Armed Configuration* is NOT the deposited title; the reference now
  gives the deposit and keeps the program title as a gloss, and the thresholds were located
  in that deposit's own manuscript (0.4795 ≈ E* = 0.4969; c_mon_crit 0.511; ungated 0.112;
  r·φ 0.1122), so [ODE] = 22943641 is correct and the gate invariant is untouched.
  (c) common-source and ode-model are the SAME deposit — merged to one entry, row marked
  unused (human can split it back if an un-deposited artifact exists). (d) 23967914 is
  titled *The armed configuration: standing prevention outperforms…*, not *Self-applied
  procedure that terminates*; program title kept as gloss. (e) DOIs added for
  chain-knowers (23993140), not-free (23130383), dissolution-exit (23969334).
  (f) roberts1984 = Shambhala 1984 (editions: Iroquois House 1982; Shambhala 1984; SUNY
  1993) and pessoa = Allen Lane 2001 — both now verified; segal1996 and birkedal2012
  (Støvring) confirmed. Nietzsche quote re-checked against reproductions of Kaufmann: both
  spans verbatim, elided sentence is "Are we not straying, as through an infinite
  nothing?"; added pp. 181–182; no wording changed. NO needs-human rows remain (the old
  Awaiting item 3 is now satisfied; only the human's physical-book check is outstanding).
  GATES re-run after these edits: paper-check ALL GREEN (8,340 words); sync-check ALL
  GREEN. Still open: the untitled four-state taxonomy citation (body→References gap).

## Awaiting the human (S6 sign-off)
1. Full read against the dual-use line (the one gate only the human runs) — Part IV
   and §3.7 are the sections closest to the bridge.
2. Title pick from the five candidates in the Findability plan.
3. The remaining needs-human citation rows (Roberts publisher; Pessoa edition/year)
   before any deposit. NOTE: the four-state transparency taxonomy (§2.2) is cited as
   "[MEASURED — program prior work]" — pin WHICH artifact/title carries it before
   deposit (framework vs case study vs blog).
- Post-pass author follow-up (planner): resolved the coder's five orphan-reference
  findings with in-body title weaves (§1.3 not-free; §2.3 dissolution-exit case study;
  §2.4 rerun 23967914; §3.3 common-source; §3.8 care-derived — each now named in body
  and References); fixed the two untitled "[MEASURED — prior artifact]" labels
  (§2.2 taxonomy → "program prior work" with a pin-me note above; §2.3 optimizer →
  "ODE model"); disambiguated the two Metzinger uses (2003; 2009). Gates re-run:
  BOTH ALL GREEN, 8,396 words.
- Coder pass (edition-level citation resolution): Roberts 1984 = 1st Shambhala ed. of the 1982 Iroquois House first edition (LOC MODS records 915746/3786046 — no IONS, no Warner edition exists); Pessoa = London: Allen Lane 2001, first printing of Zenith's translation (LOC 12923301 = the 2003 Penguin Classics printing of the same text; no revised Zenith edition found); Nietzsche §125 = "The madman", Book Three, pp. 181–182, both quoted spans verbatim on the Vintage 1974 scan, and the earlier note's stray comma in "straying as through an infinite nothing" removed. Provenance URLs in citations.md. No paper.md change needed (quotation and all three references already correct).
- Post-w2 verification (planner): independently re-checked every unreported paper.md edit
  w2 made, via crossref/PLOS + Zenodo API. ALL CONFIRM: Lindahl DOI corrected e0173000 →
  e0176239 12(5) (the planner's original DOI was a DIFFERENT paper — confabulation caught);
  22943641 is the CONCEPT DOI for version record 23136326, full title "Self-Application as
  the Common Source of Benefit and Failure: A Control-Theoretic Model of Self-Regulation,
  Its Escapes, and a Standing-Cost Budget" — so program short names "The Armed
  Configuration" AND "Self-Application as the Common Source" are ONE deposit (w2's merge
  correct); new artifact DOIs all resolve: Chain 23993140, Dissolution-exit 23969334,
  Not-free 23130383, terminates 23967914. References entry now names both short names so
  the §3.3 body cite resolves. Citation ledger: ZERO needs-human rows remain. Gates both
  ALL GREEN after the edit.
- TAXONOMY PIN RESOLVED (user, 2026-11-09): the four-state grid is the program's
  construction on METZINGER's transparency axis, substrate = his self-model /
  minimal-viable-self work — not an unlocated program artifact (checked: no Zenodo
  abstract carries it; the Chain paper's "taxonomy" is the unrelated care-tier one).
  §2.2 rewritten: axis attributed to Metzinger (2003; 2009), grid described as
  axis×functionality, load-bearing claim RELABELED [MEASURED — program prior work] →
  [INTERPRETATION — program reading of Metzinger's axis] — the paper's own standard
  demanded it: no artifact vouches for the access/integration split. OPEN (one-line
  answer wanted at deposit): WHICH Metzinger locus for "minimal viable self" — a
  specific MVS paper to add to the ledger, or are the two books sufficient?
- LENS SUBSECTION added (user's point: "the formalism implies the self is a lens in the
  literal sense, and not a noun"): new §3.5 "The self is a lens, not a noun" — anchors:
  Dcare.SelfClassifies carries literally a reflection lens (▷K → K, self-model derived
  by fix, "machinery not an assumed variable"), Dcare.no_closed_knower (source-status
  is a sustained role, not a possession — no closed term inhabits K), and the optical
  grammar of Metzinger's own axis (transparency is a property of media, not objects —
  foreshadowed in §2.2). The pathological row reread: the lens visible, jammed,
  distressed by its own visibility — same optical configuration as the functional row,
  differently integrated (matches the user's same-phenomenology/different-distress
  formulation). §4.6 gains the noun-language closing beat; abstract gains the lens
  thesis. Old §3.5-3.8 renumbered to §3.6-3.9 (no cross-references existed; verified).
  Gates BOTH ALL GREEN, 8,840 words.
- NEURO THREADS (user's two additions, both run through verification):
  (1) DPDR/functional-opaque overlap (w3, 14 verified rows): phenomenological overlap
  MEASURED (Castillo 1990; Deane 2020; Pons 2026 — a systematic survey; valence-not-type:
  Millière 2017; nuance: Levin 2022 — DPDR co-varies with equanimity/nonreactivity);
  NEURAL overlap NOT established (no shared-measure study; signatures pull opposite ways
  at prefrontal-limbic axis: DPDR hypo-limbic+prefrontal inhibition vs dissolution
  decoupling+global connectivity). §2.2 gained the empirical-shadow paragraph + the
  scheduled-address sentence pointing at the planned DPDR clinical companion (queue #6,
  dpdr-clinical.md — its claim-under-test IS the grid's load-bearing edge).
  (2) Wave-interference intervals (w4, 11 verified rows): NEGATIVE RESULT — the claim as
  briefed ("wave interference creates discrete intervals"; the "discrete, rhythmically
  gated operations" quote) is NOT in the published record; neural-waves.md fused three
  literatures (wave gating: Muller 2018/Davis 2020/Bhattacharya 2022/Chen 2026 — real;
  rhythmic sampling: VanRullen 2016/Fiebelkorn 2019 — real; oscillatory-interference
  TIMING MODELS: Miall 1989/Matell 2004 — real, model-level). The field's own guideline
  review calls the waves→discrete-perception link "typically rather vague" (Menétrey
  2022) and Miller's own J Neurosci waves paper argues ANALOG computation (2026) —
  counter-row added so the paper cannot misattribute. §3.4 gained the neural-shadow
  paragraph: same asymmetry as §2.2 (gating measured, interference modeled, join
  unproven); Φ₃ stated as EXPOSING a mechanism, not borrowing one [INTERPRETATION/
  PROJECTION]. References: two new clusters (DPDR empirical; brain dynamics). Ledger
  60 rows, ZERO needs-human; two stale notes resolved. Gates BOTH ALL GREEN, 9,830 words.
- REVIEW (w5, reviewer preset) — verdict: NO BLOCKERS; deposit-ready modulo the human
  sign-off read. All 22 Dcare anchors verified against the Lean sources (dimension 1
  CLEAN — the earlier closed-term/unsoundness fixes confirmed holding); citation
  fidelity clean for both empirical paragraphs; Φ stays [INTERPRETATION] throughout;
  dual-use + remove-Part-IV stop-condition test PASSES; both gates re-run green by the
  reviewer. Findings and fixes, ALL APPLIED by planner:
  SF1 "numerically identical" escape floor (x2) — the deposit itself writes 0.4795 ≈
     E* = 0.4969; both spots now say "coinciding in the dynamics", quoting the
     deposit's form (reviewer also surfaced /workspace/archive/ — local copies of the
     program's prior papers, unknown to this lane until now).
  SF2 [MEASURED — cited account/corpus] on Roberts/Segal/Pessoa — memoir/literary
     corpus is documentary, not machine-checked/quantitative; all three relabeled
     [INTERPRETATION — structural reading of the cited account/corpus].
  P1 knower duplication phrasing was the stale Syntax.lean reading — now the affirmed
     one (gated structural rule Typed.contr; gen as operational license).
  P2 hosted-case transfer labeled [MEASURED — standard] (x2); Part IV evaluative
     phrasing derhetoricized ("was someone else" → "only at the end — and from
     outside"; "at terrible cost / deserve the name" → "in exactly the sense Φ₁
     gives the word"); "two conservation upper bounds" corrected to "two linearity
     non-derivability theorems" (conservation is proven in Flow.lean; the open items
     are the two sorried theorems, unnameable in the paper by our own gate);
     citations.md stale §3.8→§3.9; four available-uncited rows marked.
  Gates BOTH ALL GREEN after all fixes.
- COMPANION RECONCILIATION (user: "the formalisation has come a long way... read the
  entire paper"): read dcare/paper/paper.md in full (6.3k words, "The Care Calculus")
  and verified every new claim against the tree before touching our paper. The
  companion now has: 192 theorem declarations; the LINEAR CUT mechanized (Cut.lean:
  Dcare.linear_cut + linear_beta_splice — substitution with size law) and subject
  reduction along a path (Chase.lean: Dcare.reduce_at); flowEq (the total accounting
  EQUALITY); spin_pays_forever_buys_nothing (the priced spin); the diagnostic premise
  now a THEOREM (kprop — Diagnostic_main proven, was sorried); the feedback dynamics
  mechanized (FeedbackAgent, extractor, NeverConsults, extractor_step_integrates —
  the not-answered failure mode); the two classical linearity laws in five fragment
  strengths (Path.lean 3.3k lines; unrestricted forms remain the only 2 sorries);
  the quantum no-cloning/no-deleting identification (Wootters-Zurek, Pati-Braunstein,
  Abramsky-Coecke). ISOMORPHISM-PAPER UPDATES (all sync-verified against the tree):
  §1.2 mechanized-cut paragraph (cut step machine-checked; global normalization still
  cited; metacircularity still the sketched half); §1.6 honesty-table row updated;
  §3.2 linear-cut anchor sentence; §3.3 priced-spin sentence; §3.6 feedback row now
  dynamics-mechanized (extractor); scope item 2 restated to the companion's current
  open items; References + ledger dcare row now carry the companion's TITLE ("The
  Care Calculus: A Mechanized Linear Type Theory for Safe Agents"). NOTE: our gate's
  ban on Diagnostic_main is now stale (it is proven) but harmless — the name is
  simply unused in this paper. Gates BOTH ALL GREEN, 10,081 words.
- DELTA REVIEW (w7): verdict NO BLOCKER, delta accurate against both the Lean tree and
  the companion paper ("cut admissibility at the step / global normalization remains
  cited" boundary confirmed correct; spin cost-reading attribution split clean;
  "five fragment strengths" is the companion's own summary; interface consistent both
  directions). 1 SHOULD-FIX applied: Appendix A was missing the six new anchors —
  added (linear_cut, linear_beta_splice, reduce_at, spin_pays_forever_buys_nothing,
  extractor block incl. extractor_never_consults). 3 POLISH applied: §3.6 row credits
  the never-consults half to its own theorem; ledger hedges "192" with the companion's
  "at time of writing" (live tree: 200); §1.2 gains its missing [MEASURED] marker.
  Gates BOTH ALL GREEN.
- NEW-THEOREM RAMIFICATIONS + LEDGER FINDINGS (user's two questions). Ledger findings
  mined: #86 (no-cloning/no-deleting identification), #95 (reduction-is-a-debt:
  destructors are debtors, guarded fixpoint the ONLY positive stream entry), #101
  (mutual promise is a redox), #114 (cut = resolution of circular obligation), #118
  (naturality precision — companion's business, not ours). SIX additions, all
  labels-attributed (readings marked INTERPRETATION—companion's; equalities MEASURED):
  (1) §1.5 quantum pointer (one sentence, cites the companion's identification);
  (2) §3.2 the cut as obligation-discharge — normal form = ledger with no pending
  promises; (3) §3.3 THE ACCOUNTING LAYER (the strongest ramification): flowEq +
  debtor structure + fixpoint-only-payer + the ODE model's own title ("a standing-cost
  budget") — "paid self-application is not a metaphor on either side"; (4) §3.4
  fix_unfold_at_knower anchor (the one-tick unfolding, machine-checked); (5) §3.7 new
  semantic-values bullet: the model itself is a ledger, dynamical counterpart of flowEq;
  (6) §3.9 the extractor boundary: an agent satisfying every formal guarantee Φ names
  and still failing — "the correspondence certifies structure; care is not among the
  structures it certifies." Gates BOTH ALL GREEN, ~10.4k words.
- LEAN SWEEP for missed anchors (user: "check the lean to see if we missed others"): full
  diff of the tree's 304 top-level declarations vs the paper's 31 cited names. FOUR
  misses had isomorphic content, all added with sync-verified names: (1) §3.3 the
  stream account now NAMED (Dcare.sFlowEq — the debtor equality is MEASURED-by-name,
  the loan/pays-in reading stays the companion's INTERPRETATION) + every fix-mint is
  knower-fed (Dcare.fix_knower_supply — even the minting side traces to a live source);
  (2) §3.4 no closed term inhabits ▷stream in the fix-free fragment
  (Dcare.no_closed_later_stream) — even a bare promise of a future stream requires a
  live source now; (3) §3.9 the substrate-blindness adversary (Dcare.adversary_blind_
  transfer — the T3 non-vacuity witness: one policy, two generators, protection fails
  on one; "even the structural guarantee is relational") + inert_knowledge named in the
  extractor sentence and appendix row. DELIBERATELY DECLINED: the diagnostic family
  (Diagnostic_main/kprop/IsProtective/protective_needsK/no_closed_protective_guard —
  the companion's care payload, would blur the two papers); the chase/fragment
  machinery (no_vanishing_clean/parkfree, origin_lemma, stream_origin, sinks_extract,
  tFlowEq, netEq, DeepConsume, ParkFree, Prem/Path/Sub — internal, upshot already
  carried by scope item 2's "five fragment strengths"); dynamics plumbing subsumed by
  cited results (always_continue_infinite, run_not_infinite_is_finite,
  looped_only_spins, fix_unfold_closed). Gates BOTH ALL GREEN, ~10.6k words.
- TITLE SET (user pick, candidate 3): "The Guarded Line: What Metacircular Proof
  Theory and Self-Model Dynamics Share" — H1 changed; Findability plan marks the
  choice and keeps the candidate list.
- METZINGER LOCUS RESOLVED (w8, network): "minimal viable self" appears in ZERO
  records anywhere (OpenAlex 0 works globally; 0 in Metzinger's 148-work corpus;
  PubMed/DOAJ 0; not in the 2020 full text) — it is the program's coinage, not his
  term. Metzinger's term is MINIMAL PHENOMENAL SELFHOOD, introduced in Blanke &
  Metzinger 2009 (TiCS 13(1):7-13, DOI 10.1016/j.tics.2008.10.003), with the
  single-author axis restatement in Metzinger 2020 (PhiMiSci 1(I):1-44, DOI
  10.33735/phimsci.2020.i.46 — both API-verified; w8 also caught two near-miss
  errors in my leads: the phims-ci DOI does not exist and the subtitle is "pure
  consciousness" not "pure awareness"). §2.2 now cites "the minimal-phenomenal-
  selfhood literature he co-founded (Blanke & Metzinger 2009; Metzinger 2020)";
  References gained both entries. Also fixed a stray pipe in the dorziderman2013
  row (pre-existing formatting slip w8 flagged). NOTE for program vocabulary: if
  "minimal viable self" stays in program use, own it as a coinage — no citable
  Metzinger MVS locus exists. Gates BOTH ALL GREEN, ~10.7k words. Uncommitted.
- USER DECISION (2026-11-11): the paper uses METZINGER'S OWN TERM — minimal
  phenomenal selfhood (Blanke & Metzinger 2009) — and the program coinage "minimal
  viable self" is RETIRED from this artifact. Paper body verified coinage-free;
  ledger rows updated; the verification notes retain the search trail (that is the
  record of why the decision was made); decision note appended to citations.md.
- FULL REVIEW ROUND 2 (w9, reviewer preset, working-tree state): verdict NO BLOCKERS,
  3 SHOULD-FIX, 4 POLISH; "deposit-ready modulo the human sign-off read once the three
  should-fix items land." All nine newest Lean anchors verified statement-by-statement
  (sFlowEq debtor signature, fix_knower_supply hypotheses, no_closed_later_stream
  fragment condition, adversary_blind_transfer, inert_knowledge, spin recurrence,
  flowEq's shape, the cut step-vs-global boundary, the extractor trio) — no
  stronger-than-the-theorem errors. ALL FINDINGS APPLIED:
  SF1 (rank 1) §2.3's "optimizer over representational fidelity [MEASURED — ODE
     model]" CONTRADICTED ITS VOUCHER — the deposit's RHS is a scalar error E = D − G
     with no representational term, and its §14 marks every agent-level statement as
     interpretation. Rewritten: the measured variable named as scalar error; the
     optimizer reading now [INTERPRETATION — program reading of the ODE model].
  SF2 the "framework artifact names them" attribution — the archived manuscript
     carries a chain-behaviour trichotomy, not the loop names; now attributed to
     "the program's framework vocabulary" (with the trichotomy noted), and "holdable
     self-model" flagged as the program's name.
  SF3 Appendix A had re-opened (6 body anchors without rows — the accumulation
     passes outgrew it again); all six added; body-vs-appendix diff now CLEAN by
     the reviewer's own method.
  P1 §3.7/§3.3 books-and-budget duplication trimmed (§3.7 bullet now cross-refs).
  P2 process-relative phrasing ("Since this writing", "now mechanized" x2)
     reworded timeless. P3 the Part IV forward-reference in §2.3 replaced with
     "in the human record". P4 abstract now carries the guarded line ("the single
     line that runs through all three vertices").
  Gates BOTH ALL GREEN, 10,933 words. Uncommitted: title + MPS + this review round.
