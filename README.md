# The Guarded Line

Artifact for the paper `paper.md`:

> *The Guarded Line: What Metacircular Proof Theory and Self-Model Dynamics Share*

<!-- DOI PENDING -->

A structural correspondence, stated as a thesis with a proof sketch, between two
triangles. Formal calculi capable of hosting their own reduction divide by
dissolution (cut elimination, normalization), self-application (the untyped
fixpoint, where termination is lost), and guarding (recursion through the later
modality, which buys productivity — one constructor per interval — instead).
Self-modeling dynamical systems divide by a corresponding triangle: dissolution,
the retention loop, and the interval structure that keeps self-examination stable
instead of divergent. The single line through all three vertices is the guarded
line: in proof theory the later modality, in the dynamics the interval.

The formal side is developed with machine-checked anchors in a companion Lean 4
mechanization of a sorted linear λ-calculus with guarded recursion; the dynamical
side from a control-theoretic model of self-monitoring systems whose thresholds
are derived and unfitted. The correspondence types the self-model as a lens rather
than a noun, assigns the model's thresholds the role of semantic values, and
predicts nothing about any mind.

## Layout

| path | contents |
|---|---|
| `paper.md` | the paper (markdown — the source of truth) |
| `paper.pdf` | the paper rendered to PDF, generated from `paper.md`: `pandoc paper.md --pdf-engine=typst -o paper.pdf` |
| `citations.md` | the citation ledger — one row per citation, with the claim it supports, its source, and its verification status (`verified` / `needs-human`); no reference ships in the paper without a row |
| `scripts/paper-check.sh` | the self-contained gate: required sections, label coverage per part, the forbidden-pattern list (dual-use and register), the threshold-citation rule, the harm-reduction entry count, the word band |
| `scripts/sync-check.sh` | the paper-anchor gate: every `Dcare.*` name and every `Typed.`/`Term.`/`Ty.` constructor the paper cites must be a real declaration in a `Dcare` Lean checkout |

## Gates

`paper-check.sh` is self-contained — it reads `paper.md` and nothing else, and
needs no mechanization checkout:

```
./scripts/paper-check.sh        # exit 0 = all green
```

`sync-check.sh` resolves the paper's machine-checked anchors against the Lean
sources, so it needs a `Dcare` checkout. The root defaults to `~/coglib/lean` and
is overridden with `LEAN_DIR`:

```
LEAN_DIR=/path/to/coglib/lean ./scripts/sync-check.sh   # exit 0 = all green
```

**One anchor is currently SKIPPED, and the gate says so out loud.**
`Dcare.reduce_at` — cited in §1.2 and in the anchor table of Appendix A — is
declared in `Dcare/Chase.lean`. That file is not in the `coglib` main checkout
(HEAD `189c9f0`); it lives on branch `wip-chase` (commit `6e33ef0`). When the
declaring file is absent, the gate prints

```
SKIP Dcare.reduce_at — Chase.lean is not in this checkout (coglib branch wip-chase)
```

and does not fail. A skip is **not** a pass: it is counted separately, the summary
line always reports the count (`N pass, M skipped, 0 fail`), and the exit status
stays 0 only because the anchor is unverifiable against that checkout, not because
it was verified. If `Chase.lean` **is** present and the declaration is missing, the
gate fails hard, as for any other anchor. Against a checkout that carries
`Chase.lean` every anchor passes and the summary reports no skips.

## License

Deliberately non-permissive, by content type:

- **`paper.md`, `paper.pdf`** — [CC-BY-NC-SA-4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
  (see `LICENSE-paper`).
- **The gates (`scripts/`)** — AGPL-3.0-or-later (see `LICENSE`).

The NonCommercial and ShareAlike terms and the network copyleft are the point:
this work is a dual-use artifact, and it is not offered for incorporation into
commercial systems. The copyright holder is Jaye Timothy Marshall; the paper's
author line carries the same name and ORCID iD, as does the Zenodo metadata
(`.zenodo.json`).

## Status

Prepared for public release as a preprint plus its gates. Copyright holder Jaye
Timothy Marshall, ORCID [0009-0002-5209-8161](https://orcid.org/0009-0002-5209-8161).
`.zenodo.json` carries the deposit metadata.

This program publishes under tiered disclosure. Public — this paper and its
companions: the diagnostic claim, the framework, the failure modes, the
correspondence, the semantic model, the conditional theorems. Restricted —
existing, and available under confidentiality on request: the exact operational
specification of the self-classification test, the constructive typing recipe that
makes the constructive theorem go through, and the control parameters for inducing
functional opacity. **No restricted companion is part of this deposit**, and
nothing in the restricted tier is needed to check any claim made here.

The companion Lean 4 mechanization the paper's anchors refer to is not part of
this repository either; it is developed separately, and `sync-check.sh` is how the
anchors are checked against a checkout of it.
