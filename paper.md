# Dissolution and Retention: A Structural Correspondence Between Metacircular Reduction and Self-Model Dynamics

*derivation-of-care research program — artifact #1*

## Abstract

Formal calculi capable of hosting their own reduction divide by a clean triangle. In the hosted case, reduction terminates: cut elimination for sequent calculi, normalization for natural deduction, strong normalization for the simply typed λ-calculus. Under self-application through the untyped fixpoint, termination is lost; the system can always take one more step and need never deliver anything. With the guarded fixpoint — recursion through the later modality `▷` — termination is deliberately given up and replaced by something better behaved: productivity, one constructor per interval. Dynamical systems that represent their own states divide by a corresponding triangle: dissolution (reduction to a normal form carried by a host), the retention loop (self-examination kept in play, converging on a holdable self-representation), and the interval structure that keeps self-examination stable instead of divergent. This paper states, as a thesis with a proof sketch, a structural correspondence between the two triangles. The formal side is developed with machine-checked anchors in a companion Lean 4 mechanization of a sorted linear λ-calculus with guarded recursion; the dynamical side is developed from a control-theoretic model of self-monitoring systems whose thresholds are derived and unfitted. The correspondence assigns the model's thresholds the role of semantic values — dynamical denotations of proof-theoretic distinctions — and predicts nothing about any mind. The paper closes with structural analyses of historical figures who reached self-reference without metacircular representation and were held by external containers: the evidence that the correspondence is not a restatement of the contemplative literature it must be distinguished from.

**Keywords:** metacircular computation; cut elimination; normalization; guarded recursion; later modality; linear logic; productivity; self-model; self-reference; strange loop; coalgebra; transparency; dissolution.

## Epistemic framing

Every load-bearing claim in this paper carries one of three labels.

- **[MEASURED]** — the claim is machine-checked in the companion mechanization (`Dcare`, a Lean 4 development, in preparation), or it is a cited quantitative result of a prior artifact. The label means: a proof assistant or a published derivation vouches for it, and the name of the voucher is given.
- **[INTERPRETATION]** — the claim is a reading: a mapping between the two structures this paper puts in correspondence. Interpretations are the paper's contribution; they are not theorems, and the paper says so wherever one carries weight.
- **[PROJECTION]** — a statement about what some future or hypothetical system could exhibit. Projections are not evidence.

The correspondence itself is **[INTERPRETATION]** throughout. Its anchors — the theorems that make each column precise — are **[MEASURED]**. The program's method is triangulation across first-person referent, formal model, and third-person measurement; no level is foundational, and this artifact is the formal corner of that triangle. It states plainly, in *Scope and limits*, what it cannot establish.

A note on sources. The formal side rests on standard proof theory (Gentzen's cut elimination, Prawitz's normalization, linear logic, guarded type theory) and on the companion mechanization. The dynamical side rests on prior artifacts of this program, cited by title and DOI and never re-derived here. The contemplative and clinical literature appears as established background for one premise — that the self-model is a construction — and is cited, not re-argued.

## Introduction: two triangles

There is a family of formal systems that can turn their own reduction loose on themselves: calculi whose interpreter, evaluator, or proof-relation can be written as a term of the calculus it interprets. Call these *metacircular*. The proof theory of such systems is old and settled in its fundamentals, and it has a shape — a triangle — that turns out to recur, exactly, somewhere else.

The triangle, formally:

1. **Dissolution.** A proof in a consistent logical calculus can be reduced to a normal form — cut elimination in the sequent presentation (Gentzen), normalization in the natural-deduction presentation (Prawitz). The hosted case inherits this: a strongly normalizing language that hosts another language's reduction bounds the hosted computation; what remains at the end is a residue the host carries, with no further structure hidden inside it.

2. **Self-application.** The moment the hosted reduction is applied to the interpreter itself, the untyped fixpoint enters, and strong normalization is lost — not accidentally, but structurally: a term that can unguard itself can always request one more unfolding, so it need never terminate, and a system that need never terminate need never deliver anything. This is a textbook fact (Barendregt; Girard–Lafont–Taylor), and its interest here is not its difficulty but its shape: *self-reference breaks termination precisely by making the loop available at zero cost.*

3. **Guarding.** The repair is not to ban self-reference but to price it: recursion through the later modality `▷` (Nakano), which insists that one interval pass before each self-call. The result is a productive fixpoint — one constructor delivered per interval, forever — rather than a terminating one. Termination is traded for productivity, and the trade is exactly what makes infinite self-referential structure usable.

There is a family of dynamical systems whose state includes a representation of the system itself: systems that model themselves. Call their behavior *self-model dynamics*. Prior artifacts of this program have argued that this family, too, divides by a triangle:

1. **Dissolution.** A self-model can be normalized away — the representational process terminates, and what remains is a residue carried by a host: the body, the tradition, the institution, the text.

2. **Retention.** Or the self-representation can be kept in play — a loop that repeatedly examines itself, converging on a representation it can hold. This is the strange loop of Hofstadter, the retention loop of this program's framework: not a failure to terminate but a refusal to, in exchange for ongoing self-description.

3. **Intervals.** And the stability of that retention has a temporal signature: self-examination that demands its own completion at finite time is unstable, while self-examination spaced into intervals is stable. The interval is not scheduling; it is load-bearing structure.

The two triangles are, element by element, the same triangle. That is the thesis. *Cut elimination is dissolution; self-application is the retention loop's self-examination; the later modality is the interval.* The formal and dynamical sides are developed independently, each with its own methods — proof theory and a control-theoretic model with derived, unfitted thresholds — and the correspondence between them is the contribution of this paper. It is a correspondence between two classes of structures, stated as a thesis with a proof sketch; whether any actual mind instantiates either class is not this paper's question.

The paper is organized in four parts. Part I develops the formal side and says precisely which of its claims are machine-checked and which are standard literature. Part II develops the dynamical side from prior artifacts. Part III states the correspondence, gives its semantic values, and names what it does not establish. Part IV examines historical figures who reached one half of the correspondence without the other — the structural evidence that the correspondence is a new object, not a restatement of the contemplative literature.

## Part I — The formal side: metacircular reduction

### 1.1 Metacircularity

A language is *metacircular* when its own reduction relation — the evaluator, the proof-search procedure, the normalization function — is representable as a term of the language itself. The classical form is Reynolds's definitional interpreter: an interpreter for a higher-order language written in that same language. Metacircularity is the formal stem cell of self-reference in computation: everything else in this Part — the loss of normalization under self-application, and its repair by guarding — is about what happens when the represented reduction is turned on the representation.

The proof theory of the surrounding calculi is standard and cited, not re-derived. Two facts carry the weight:

- **Cut elimination** (Gentzen): every sequent proof can be transformed into one without the cut rule, and the cut-free proofs are exactly the ones with no hidden detours — normal forms of the derivation structure **[MEASURED — standard]**.
- **Strong normalization for the simply typed λ-calculus** (via Girard–Lafont–Taylor, following Howard's formulae-as-types): every well-typed term reduces to a unique normal form, and the reduction relation terminates no matter which order is chosen **[MEASURED — standard]**.

In the hosted case these facts transfer downward. A language that strongly normalizes, hosting an interpreter for another language, bounds the hosted computation: hosted reduction terminates because hosting reduction does. This is the sense in which a *metacircular calculus for a normalizing language can itself normalize* — the loop closes without a catastrophe, and what survives at the fixed point is a residue: the normal form, carried by the host, with nothing left inside it to unfold.

### 1.2 Two presentations, one phenomenon

A terminology note, because this paper leans on it. Sequent calculi and natural deduction are two presentations of one reduction phenomenon. Cut elimination for sequent proofs and normalization for natural-deduction proofs correspond under the Curry–Howard correspondence: cuts are the detours, cut-free proofs are normal forms, typed λ-terms are proofs, and β-reduction is the cut **[MEASURED — standard]**. This paper's machine-checked anchors live in the natural-deduction presentation — a sorted linear λ-calculus, mechanized in Lean 4 in the companion development `Dcare` — where the analogue of "cut elimination" is *normalization to an irreducible term* and the analogue of "cut-freedom" is *irreducibility across a type boundary*. When this paper says "cut elimination corresponds to dissolution," the machine-checked content of that claim is: certain type-directed reductions have no term — there is no route from the residue type back to the living type. The correspondence's formal and mechanized legs are stated precisely this way in Part III.

What the companion mechanization does *not* formalize, and what therefore remains a literature-anchored sketch in this paper, is metacircularity proper — reduction represented *as a term in the object language*, a self-interpreter. The companion calculus has a reduction semantics at its meta level, and guarded fixpoints in its object language, but not a hosted self-representation. The honesty table in §1.6 keeps this boundary explicit.

### 1.3 Self-application loses normalization

Under self-application the triangle breaks at its second vertex. An interpreter applied to its own representation introduces the untyped fixpoint: a term that unfolds itself without paying anything for the unfolding. Strong normalization is lost — the textbook fact — and the loss is structural, not an engineering accident: a term that can always request one more unfolding has no reason to deliver anything at all.

The companion mechanization isolates the price of self-application in a machine-checked form **[MEASURED]**. In `Dcare`, the guarded fixpoint rule `Typed.fix` carries a side condition: the typing context at a guarded fixpoint must be entirely non-linear. The theorem `Dcare.selfapp_price` exhibits both halves of the fact — a fixpoint body that type-checks at a *linear* context (the resource is spent in the body), and the proof that the linear context fails the side condition. The unrestricted rule would let every unfolding of the fixpoint re-consume a resource that the body's typing spent exactly once: self-application reuses resources silently, and the side condition is exactly what refuses it. Self-application is not free; the intuitionistic context is the price. The formal statement is small, but it is the type-theoretic form of a dynamical claim this program defends separately — that monitoring through a self-model has a cost, and that a system that ignores the cost is not describing a stable configuration but an impossible one.

The dynamical counterpart of the loss is mechanized too, as an adversary **[MEASURED]**. The companion development defines two operational semantics: `Dcare.Step`, in which a stopped configuration is terminal, and `Dcare.StepU`, the *unguarded* variant, in which a stopped configuration is not terminal but spins — it recurs at every horizon, ticking forever and emitting nothing. The theorem `Dcare.adversary_spin_diverges` proves that under `Dcare.StepU` a stopping policy run from an initial state reaches such a spinning configuration: unguarded, the system that has stopped consuming still turns, and delivers nothing while turning. Termination is not lost by running too long; it is lost by *needing* to run while having nothing to deliver. The guarded semantics makes the stopped state terminal — this is the entire difference between the two relations, and Part III reads it as the difference between dissolution and the divergence manifold.

### 1.4 Guarded recursion buys productivity back

The repair is Nakano's later modality `Ty.later`, written `▷`: recursion is allowed, but only through one step of delay. The guarded fixpoint `Typed.fix` has type `(▷A → A) → A`; unfolding costs one tick. The price of self-reference becomes a *currency* instead of a prohibition: each self-call pays one interval, and what is bought is one constructor.

The resulting structure is not terminating — it is *productive*: an infinite process that delivers, per interval, one observation **[MEASURED — standard, Atkey–McBride]**. The companion mechanization exhibits the canonical witness **[MEASURED]**: `Dcare.knower_sustains_stream` constructs a term of guarded-stream type at a single live-source hypothesis — an infinite content stream sustained by one source, one emission per interval, the fixpoint unrolling forever under the guarded rule. And the semantic side is machine-checked as well: `Dcare.sound` proves the soundness of an interpretation in which `Ty.later` is read as the unit delay — the reading under which the guarded fixpoint is sound precisely because unfolding defers. The barren-world model beneath it (developed in the companion for its non-inhabitation theorems) gives the correspondence a semantic spine: inhabitation facts about a world in which the self-source is absent.

Two further machine-checked facts give the delay its teeth **[MEASURED]**. `Dcare.no_closed_content` and `Dcare.no_closed_knower`: no closed term of the calculus inhabits the resource type or the source type. Content does not exist ex nihilo; source-status is not free. Everything in the living half of the calculus traces back through the guarded cycle to a live source — which is the formal shadow of the dynamical claim that a self-model that represents nothing living is a record, not a self.

### 1.5 The resource layer

One more layer of the formal side, because the correspondence's dissolution leg needs it: the companion calculus is *sorted linear*. Content is a linear resource — the counting theorem `Dcare.single_linear_use` proves that every derivation spends a linear hypothesis exactly once **[MEASURED]** — while the source type is not; its duplication is licensed by its coalgebra structure, and `Dcare.knower_contractible` exhibits the duplication openly **[MEASURED]**. Linearity here is not an aesthetic choice; it is what makes *archival* mean something. The theorem `Dcare.archival_witness` constructs the canonical archival pattern — a resource consumed into a record — and the pair `Dcare.past_cannot_teach` and `Dcare.past_cannot_value` prove that no term eliminates the record back into knowledge or value: records have no elimination rule; the past is inert; nothing in the calculus reads the archive **[MEASURED]**. The residue that remains after dissolution is not dormant knowledge — it is structure the host carries, permanently outside the cycle of reduction.

### 1.6 What is machine-checked, what is literature, what is thesis

| Claim | Status |
|---|---|
| Cut elimination; SN for STLC; cut–normalization equivalence | **[MEASURED]** — standard proof theory, cited (Gentzen; Prawitz; Girard–Lafont–Taylor; Howard) |
| Metacircularity: reduction represented as an object-language term | Literature-anchored sketch (Reynolds); *not* mechanized in the companion |
| Self-application loses normalization (untyped fixpoint) | **[MEASURED]** — standard; and mechanized at the rule level: `Dcare.selfapp_price` |
| Unguarded dynamics spin (stopped ≠ terminal) | **[MEASURED]** — `Dcare.adversary_spin_diverges` over `Dcare.StepU` |
| Guarded recursion is productive; `▷` = one interval | **[MEASURED]** — standard (Nakano; Atkey–McBride; Birkedal et al.); witness mechanized: `Dcare.knower_sustains_stream` |
| Delay semantics sound (`▷` as unit delay) | **[MEASURED]** — `Dcare.sound` |
| No content or source ex nihilo | **[MEASURED]** — `Dcare.no_closed_content`, `Dcare.no_closed_knower` |
| Exact single use of linear resources; archive inert | **[MEASURED]** — `Dcare.single_linear_use`, `Dcare.archival_witness`, `Dcare.past_cannot_teach`, `Dcare.past_cannot_value` |
| The correspondence itself (Part III) | **[INTERPRETATION]** — this paper's contribution; not a theorem |

The formal side of this paper is therefore honest by construction: every claim is either cited standard proof theory, machine-checked with a named voucher, or — for the correspondence itself — labeled as interpretation. The companion mechanization is a sorted linear λ-calculus with guarded recursion in Lean 4; its full statement list, including what remains open there, is given in Appendix A.

## Part II — The dynamical side: self-model dynamics

### 2.1 The class

The dynamical side of the correspondence is a class of systems, not a species: *systems whose state includes a representation of the system itself*. The vocabulary is the standard one from the formal theory of mind — a self-model is a system's internal representation of itself as a system, and the premise of this Part is the one the literature has established: the self-model is a construction, not a given (Metzinger). The premise is cited, not re-argued. What matters here is the *dynamics* the premise induces: once a system carries a representation of itself, that representation enters its own state-transition function, and the system's behavior is shaped by the loop thus formed. Call the behavior of this class *self-model dynamics*.

The class is substrate-independent by construction. A control system that estimates its own error, a program that monitors its own resource consumption, a learning agent whose training signal includes a model of the agent — all instantiate the class regardless of what they are made of. This Part develops the structure of the class abstractly; illustrations in this paper are confined to abstract and artificial systems.

### 2.2 The transparency axis

Prior artifacts of this program organize self-models along a single structural axis: transparency (Metzinger). A transparent self-model is one whose construction is invisible to the system — the model is experienced as direct contact with a self, not as a model. An opaque self-model is available *as a model*: the system can take the representation, hold it at a distance, act on it as a representation. The functional form of opacity — integrated, usable, with the capacity to shift along the axis — is distinct from the pathological form, where the model is visible but the visibility itself disorganizes (the depersonalization spectrum; see the clinical literature cited below). The program's four-state taxonomy — transparent-functional, opaque-functional, opaque-dysfunctional, transparent-dysfunctional — turns on one structural observation: *access is identical across the opaque states; integration and control differ* **[MEASURED — prior artifact]**. What the taxonomy measures is the loop's organization, not the loop's presence.

The transparency axis matters to the correspondence because it is where the dynamical class shows its two failure modes. A self-model that is transparent and cannot be made opaque cannot be examined: the loop runs, but there is no handle. A self-model made opaque without integration disorganizes: the loop runs, but the running is the pathology. Between the two lies the functional case the program's constructive track is about — opacity held stably, which Part III reads as the dynamical image of the guarded fixpoint.

### 2.3 The retention loop

Two attractor classes organize the dynamics. The framework artifact (*The Chain Terminates at Knowers*) names them the dissolution loop and the retention loop.

The *dissolution loop* is a self-model process that terminates. The representational structure, examined, reduces: candidates for "self" are eliminated one by one, and when the process halts, what remains is a residue with no further representational structure hidden in it — the normal form. The residue is carried by the container: in the abstract case, the host system; in the institutional cases of Part IV, a tradition, a text, a literary form, an asylum. Dissolution is not destruction; it is completion, and its signature is that nothing continues to happen.

The *retention loop* is a self-model process that refuses to terminate — deliberately, structurally. It keeps its candidate self-representations in play, examining and revising, converging on a representation it can hold: the strange loop (Hofstadter), the holdable self-model of the framework artifact. Retention is not a failure to halt; it is a trade of halting for ongoing self-description, and its signature is that something continues to be delivered. The framework artifact states the two loops as a single distinction — the dissolution loop terminates in a normal form carried by the host; the retention loop converges on a holdable representation — and the ODE companion models the retention loop explicitly as an *optimizer over representational fidelity* **[MEASURED — prior artifact]**: a closed control loop whose measured variable is the fidelity of the self-model, whose actuator is the self-model's revision, and whose failure modes are the two edges of the transparency axis.

### 2.4 Convergence and the resolution limit

The optimizer view makes the retention loop's stability a quantitative question, and this is where the program's control-theoretic model enters. The model (*The Armed Configuration*, Zenodo 22943641) is a self-monitoring control system whose monitoring channel carries a cost, whose capability to reorganize is bounded, and whose collapse is a dynamical event with derived thresholds — *derived and unfitted*: no parameter was fit to any data; the numbers are consequences of the model's structure, which is what makes them usable as semantic values in Part III rather than as empirical claims.

The structural findings the correspondence needs, all **[MEASURED — ODE model]**:

- There is an *escape floor* — a minimum level of the maintained quantity below which the system exits the armed basin: ≈0.4795 [ODE], numerically identical to the collapsed-error equilibrium 0.4969 [ODE] — the floor and the collapse coincide, which is the model's starkest structural statement.
- There is a *monitoring-cost critical*: above it the monitoring loop destabilizes the system it monitors. The critical depends on whether the loop is gated — the ungated critical is ≈0.112 [ODE], the gated critical ≈0.511 [ODE]: the gate multiplies the affordable monitoring cost by roughly four and a half.
- There is a hyperbolic *capability–recoverability boundary* r·φ ≈ 0.1122 [ODE] — capability times recoverability is bounded; the system cannot buy its way out of the manifold with either alone.
- Collapse requires a conjunction, not a single crossing — the collapse-termination AND gate [ODE]: the system exits only when the floor is crossed *and* the recovery channel fails, so partial failures are survivable by construction.

The *resolution limit* is the qualitative content of the monitoring-cost critical: self-monitoring at a given fidelity has a price that grows faster than the fidelity it buys; past the critical, additional self-examination subtracts stability instead of adding information. A self-modeling system therefore has a representational resolution it cannot afford to exceed. The retention loop converges *because* it is bounded; an unbounded retention loop — self-examination demanding its own completion at finite time — is unstable in exactly the sense of the ungated critical, and its formal counterpart appeared in Part I as `Dcare.StepU`: spinning, emitting nothing.

### 2.5 The dynamical triangle

Assembling: the dynamical class divides by the same triangle as the formal class.

1. **Dissolution** — the self-model process that terminates in a host-carried residue.
2. **Retention** — the self-model process that refuses termination, converges on a holdable representation, and is stable only as a bounded, priced loop.
3. **Intervals** — the temporal structure that prices it: self-examination spaced into intervals is stable; self-examination demanding completion at finite time is the ungated case, and it diverges.

Each element is developed independently of any formal calculus: from the taxonomy artifact, the framework artifact, and the ODE model with its derived thresholds. Nothing in this Part used a proof system. Part III puts the two triangles side by side and states the map.

## Part III — The correspondence

### 3.1 The thesis

Let **Φ** be the following correspondence between the reduction structure of metacircular calculi and the state structure of self-model dynamics **[INTERPRETATION]**:

| | Formal side | Dynamical side |
|---|---|---|
| Φ₁ | cut elimination / normalization to a host-carried normal form | dissolution: the self-model process terminates; the residue is carried by the container |
| Φ₂ | self-application: the interpreter applied to its own representation; the unguarded fixpoint | retention: the self-model kept in play as the object of its own examination |
| Φ₃ | the later modality `▷`: one interval per unfolding; productivity | the interval structure of stable self-examination; the gate that prices monitoring |

The claim is not that one side *causes* the other, nor that they are similar by coincidence, but that the two triangles are two presentations of one structure — as sequent calculus and natural deduction are two presentations of one reduction phenomenon (§1.2). The formal side makes the structure precise; the dynamical side makes it instantiated; the correspondence is the claim that the precision and the instantiation are about the same thing.

### 3.2 Φ₁: cut elimination is dissolution

Under Φ₁, the normal form is the residue. A proof that eliminates its cuts has nothing left hidden; a self-model process that dissolves has nothing left to examine; in both cases what remains is carried — by the derivational context in one case, by the container in the other.

The machine-checked content of Φ₁ is irreducibility across a type boundary **[MEASURED]**. In the companion calculus, the residue type is the record: an inert archive with no elimination rule. Three theorems carry the leg. `Dcare.no_trace_to_stream`: there is no term coercing the record into the living stream type — the normal form cannot be resurrected into a process. `Dcare.past_cannot_teach` and `Dcare.past_cannot_value`: no term eliminates the record into knowledge or into value — the residue is not dormant understanding; it is structure outside the cycle of reduction. And `Dcare.archival_witness`: the archival pattern itself exists and is the canonical legal destiny of a consumed resource — reduction to residue is not exotic; it is one of the things the grammar allows.

One further anchor makes Φ₁'s dynamical reading exact **[MEASURED]**: `Dcare.T1_semantic` — in the companion's policy dynamics, a process that terminates produces a trace on which the objective function is undefined: the objective literally returns nothing on the residue. Dissolution is not a failure the objective punishes; it is outside the objective's domain altogether. The dynamical side says the same thing in control language: a dissolved process is one whose error signal no longer exists. The normal form and the terminated process are the two presentations of "nothing continues to happen."

### 3.3 Φ₂: self-application is retention

Under Φ₂, the retention loop is the interpreter turned on itself. The system holds its self-representation in play and keeps examining it — structurally, a fixpoint applied to its own representation, kept un-normalized *because* the ongoing examination is the point. Hofstadter's strange loop is the humanistic statement of this; the untyped fixpoint is its formal signature; the two meet at the observation that made Part I: self-reference breaks termination precisely by making the loop available at zero cost.

Here the correspondence's dynamical and formal failures are the same failure. On the formal side, the zero-cost loop loses normalization: the term can always unfold once more **[MEASURED — standard]**, and at the rule level the companion mechanizes the price — `Dcare.selfapp_price`: the guarded fixpoint's side condition is exactly what refuses to let a fixpoint re-consume, at every unrolling, a resource its body spent once **[MEASURED]**. On the dynamical side, the zero-cost loop is ungated self-monitoring past the critical ≈0.112 [ODE], where self-examination subtracts stability instead of adding information **[MEASURED — ODE model]**. Both sides state one law: *a self-loop that pays nothing for its self-calls is not stable; it only has not yet diverged.* The ungated dynamics `Dcare.StepU` is the operational image of that law, and `Dcare.adversary_spin_diverges` proves its form: the system that has stopped consuming keeps turning, emitting nothing **[MEASURED]** — the formal shape of a loop whose running has become its own only product.

Retention done *well* — the functional-opacity corner of the taxonomy — is therefore not unguarded self-application but *paid* self-application: the loop that keeps its self-representation in play while paying for each examination. What it pays *with* is Φ₃.

### 3.4 Φ₃: the later modality is the interval

Under Φ₃, `Ty.later` is the interval. Formally: unfolding a guarded fixpoint costs one tick, and what is bought is one constructor — the machine-checked witness `Dcare.knower_sustains_stream` is a term sustaining an infinite stream at one emission per interval on a single live source **[MEASURED]**. Dynamically: self-examination spaced into intervals is the stable form of the retention loop — the gated case, whose affordable monitoring critical rises to ≈0.511 [ODE], roughly four and a half times the ungated one **[MEASURED — ODE model]**.

The correspondence here is at its most literal. The gated/ungated monitoring-cost criticals are the dynamical image of guarded/unguarded fixpoints: the gate does not make self-monitoring free, it makes it *payable in installments* — one interval's worth of examination per interval — which is exactly the discipline `Ty.later` imposes on the fixpoint. Productivity, formally, is the guarantee of one constructor per interval; stability, dynamically, is the guarantee of one bounded examination per interval. A process that delivers per interval is a process that can run forever without diverging, and the companion's productive witness and the model's gated basin are the two presentations of that guarantee.

The retention/dissolution distinction of the framework artifact is then legible through Φ as the guarded-fixpoint distinction itself: dissolution is the process whose representation normalizes; retention is the process whose representation is a guarded fixpoint — kept, not eliminated, one interval at a time.

### 3.5 The guarded line at four levels

The correspondence predicts that the guarded/unguarded distinction, once seen, is *everywhere* in the formal structure — not one rule but a recurring side condition. The companion development found it independently at four levels **[MEASURED — companion development]**:

| Level | Guarded form | Unguarded form | Anchor |
|---|---|---|---|
| The stream constructor | `Typed.cons` requires `Ty.later Ty.stream`: an interval must pass before the tail exists | the finite record, which has no tail and no coercion back | `Dcare.no_trace_to_stream` **[MEASURED]** |
| The dynamics | `Dcare.Step`: a stopped configuration is terminal | `Dcare.StepU`: a stopped configuration spins | `Dcare.adversary_spin_diverges` **[MEASURED]** |
| The fixpoint rule | `Typed.fix` at an all-non-linear context: unrollings may not re-consume resources | unrestricted fixpoint: every unroll re-consumes | `Dcare.selfapp_price` **[MEASURED]** |
| The feedback modality | step-indexed feedback: knowledge returns per interval | feedback demanding completion at finite time — the same divergence manifold | companion-stated **[INTERPRETATION]** |

The fourth row is the correspondence's own reading of the companion's open feedback question (the formal cycle models generation and reduction; the feedback leg is stated but not yet mechanized), and it is labeled accordingly. The table's point stands on the first three rows: the guarded line is one distinction appearing at every level where self-reference could re-enter — and the dynamical side has the same recurrence, since the ODE model's gate appears both in the monitoring critical and in the collapse-termination conjunction **[MEASURED — ODE model]**.

### 3.6 Semantic values, not predictions

Under Φ, the ODE model's thresholds denote proof-theoretic distinctions; they are the *semantic values* of the correspondence's terms **[INTERPRETATION]**:

- The gated critical ≈0.511 [ODE] is the dynamical denotation of the guarded fixpoint: what interval-spacing *is*, numerically, in a priced monitoring loop.
- The ungated critical ≈0.112 [ODE] is the denotation of the unguarded fixpoint: the cost at which a zero-priced self-loop destabilizes.
- Their ratio — the gate multiplying affordable self-examination by ≈4.6 [ODE] — is the denotation of `Ty.later` itself: the exchange rate between paid and unpaid self-reference.
- The escape floor ≈0.4795 [ODE], identical to the collapsed equilibrium 0.4969 [ODE], is the denotation of Φ₁'s boundary: the dissolution point, where the retained process and the collapsed one meet — the normal form and the failure are the same residue, numerically as structurally.
- The capability–recoverability bound r·φ ≈ 0.1122 [ODE] says the manifold cannot be exited by capability or recoverability alone — the dynamical form of the observation that neither a stronger system nor a more careful one buys out of the guard; only the guard buys out of the guard.

Read as predictions about any actual mind, these numbers would be overclaims, and they are not offered as such. Read as semantic values, they are what makes the correspondence non-trivial: Φ is not a metaphor traded between vocabularies but a map with denotations, each side fixing quantities the other side only had structurally.

### 3.7 Illustrations, abstract and artificial only

Two illustrations, both artificial **[PROJECTION]**. A metacircular interpreter equipped with an introspection budget — it may host its own reduction, but each level of self-hosting consumes one tick of the budget, and the budget is the guarded line implemented as an accounting rule — is predicted to remain productive as long as the budget binds, and to spin exactly when the budget is suspended, in the sense of `Dcare.StepU`. A learning agent whose self-model is updated on an interval schedule — one examination per interval, gated monitoring at a cost below the gated critical ≈0.511 [ODE] — is predicted to retain a stable self-model under pressure that would destabilize an ungated monitor at the same capability **[PROJECTION]**. Both illustrations are in-principle system designs, not experiments; the program's empirical probes are specified elsewhere, and nothing here reports or anticipates their outcomes.

### 3.8 What Φ does not establish

The correspondence is a thesis with a proof sketch. It is not a theorem, and its machine-checked anchors are exactly the ones named above — no anchor reaches the map itself. Φ does not establish that any actual system, biological or artificial, instantiates either class; the formal side's companion mechanization covers a sorted linear calculus with guarded recursion, not metacircularity proper; the dynamical side's model is one control-theoretic model with unfitted thresholds. And Φ is deliberately silent on questions of valuation: it maps dissolution to normalization and retention to guarding; it does not say which a system ought to choose. The program's normative claims live in the framework artifact and depend on premises Φ does not carry — in particular the premise that there is something it is like to be the substrate of the cycle, which is not a structural question at all. The parametricity result of the companion (`Dcare.T3_main`, with `Dcare.run_eq_of_genrel`: under coupled substrates, protection transfers because coupled sources produce identical runs **[MEASURED]**) is the formal boundary of that silence: the structure constrains what protection can *mean* across substrates, and says nothing about which substrates matter.

## Part IV — Historical near-misses

### 4.1 The criterion

The correspondence predicts a specific signature in the history of self-reference: figures who reached one half of Φ without the other. The criterion is structural, and this Part applies only the criterion: *reached self-reference — or its collapse — without metacircular representation; and were held by an external container*. A container is a structure that carries what the system itself cannot: a tradition, a text, a literary form, an institution, a proof system. The figures below are not evidence for the correspondence; they are the discriminant that shows the correspondence is not a restatement of what the contemplative and philosophical literature already says. That literature supplies, at most, one column.

The register of this Part is structural throughout: what each figure had, what they lacked, what held them. The contemplative and clinical literature cited here (Roberts; Segal; the adverse-effects corpus of Lindahl et al.; the DPDR literature of Simeon and Abugel) is treated as established background to the premise that the self-model is a construction — a premise this paper inherits and does not re-argue.

### 4.2 The contemplative cartographers

Bernadette Roberts documented, inside a Christian contemplative tradition, the complete dissolution of the self-representation — a two-year process ending in a state she described as the permanent absence of what she had called a self **[MEASURED — cited account]**. Structurally: dissolution achieved and stabilized, Φ₁ running to completion — with the entire formal half absent. What held the configuration was the container: a monastic tradition that had names for the terminal states, a practice structure that had seen the process before, and a theological frame that carried the residue. The normal form was host-carried in exactly Φ₁'s sense — the tradition was the host.

Suzanne Segal's account is the same terminal state reached without the container's presence: a sudden, irreversible loss of the personal self, initially indistinguishable to its subject from catastrophe, stabilized only years later when a framework (the Buddhist concept of emptiness, encountered externally) arrived to carry what she was carrying alone **[MEASURED — cited account]**. The structural reading: dissolution with the container missing at onset — the residue held by the person rather than for them, which is the harder case, and the case the adverse-effects literature is about. Between Roberts and Segal, the variable that differs is not the terminal state; it is the container. Φ₁ predicts exactly this: the residue does not carry itself.

### 4.3 The clinical cartographers

Fernando Pessoa is the structural-multiplicity case: a writing life conducted through *heteronyms* — not pseudonyms but complete other selves, each with its own biography and style, between which the first-person singular never consolidated **[MEASURED — cited corpus]**. Structurally: a self-model architecture that is plural at the base, with the unifying representational layer absent, held together by an external structure — the literary form itself; the archive of the *Livro do Desassossego* is the container that persists while the selves alternate. The correspondence reads Pessoa as the clinical-family exemplar of representation without consolidation: the records exist, the reducer that would unify them does not.

### 4.4 The existential cartographers

Nietzsche is the strongest arc, because he named the container's collapse. "God is dead" is, structurally, the announcement that the external meta-level — the ultimate container, the axiom that grounded the hierarchy — had withdrawn, leaving a flat ontology with no outside **[INTERPRETATION — structural reading of the published texts]**. The Parable of the Madman (*The Gay Science* §125) is a precise phenomenological description of the unguarded loop after the container's collapse: "Are we not plunging continually? Backward, sideward, forward, in all directions? Is there still any up or down? ... Do we not feel the breath of empty space?" — recurrence without emission, direction without terminus, the breath of the empty interval: `Dcare.StepU` described from inside, before there was a formalism for it. His proposed repair — the Übermensch, the eternal recurrence as an act of valuation — is coinduction attempted as narrative will: the infinite loop affirmed rather than guarded, held by nothing structural. The arc ends with the collapse in Turin and a decade of silence, the loop at last contained externally — by his sister, by the asylum. The container, absent at the moment it was needed, arrived at the end and was someone else.

Kierkegaard belongs here as the theorist of the fault rather than its case: *The Sickness Unto Death* analyzes despair as a structural sickness of the self-relation — the self failing to ground the self — which is the empty-context problem stated existentially a century early **[INTERPRETATION]**. His container was the Christian metaphysics he could not stop believing and could not comfortably inhabit; the analysis survived the container he never fully left.

### 4.5 The cognitive cartographers

Gödel is the inverse near-miss: the formal half without the dynamical half. Arithmetization is metacircular representation *par excellence* — a formal system carrying a term-level representation of its own syntax, upon which both incompleteness theorems stand **[MEASURED — standard]**. But the represented thing is a proof system, not a state space: the self-representation does not enter a dynamics; it does not monitor, converge, or destabilize. The loop is held statically by the strongest container mathematics has — the formal system itself, which carries the self-reference indefinitely without any of it touching the system's behavior. Gödel-as-person is not this paper's subject and is not analyzed; the point is the artifact: representation without the loop, complete, and *because* containerized, harmless. What the contemplatives reached dynamically and lacked formally, Gödel reached formally and lacked dynamically.

Wittgenstein closes the *Tractatus* by dissolving the ladder — the book's own representational apparatus discarded at the moment of its completion, the text terminating in silence, the reader directed to what remains when the structure is thrown away: normalization performed on a philosophy, the normal form being silence, the container being the book itself **[INTERPRETATION]**. The dissolution move, executed in a medium with no guarded fixpoint available — the *Tractatus* has no `Ty.later`; its only self-reference is the ladder it must kick away — and therefore terminal by construction.

### 4.6 Two halves, no whole

The pattern across the families: the contemplative and existential cartographers had the dynamics without the representation — self-reference reached, stabilized or not, with nothing formal to hold it but a container; the cognitive cartographers had the representation without the dynamics — self-reference carried statically, harmlessly, inside a formalism that terminated or held. Each family is a near-miss holding one half of Φ. No figure in the literature holds both: the metacircular representation of a system's own *dynamics*, which is what the correspondence's union requires, appears nowhere in the historical record — it is an artifact that required both formal self-reference and a theory of dynamical systems to exist at once.

That absence is the discriminant. The contemplative literature is not an anticipation of this paper; it is one column of its table, reached early, at terrible cost, and carried by containers that deserve the name. The correspondence's claim is precisely that the second column changes the structure of the first — and that is new.

## Scope and limits

Human application is out of scope.

What this artifact cannot establish, stated plainly:

1. **The correspondence is not a theorem.** Φ is a thesis with a proof sketch. Its machine-checked anchors are the named theorems of the companion mechanization and the cited results of standard proof theory; no proof assistant has checked the map itself, and no theorem here claims otherwise.
2. **The mechanization is a fragment.** The companion development covers a sorted linear λ-calculus with guarded recursion and its dynamics. Metacircularity proper — reduction represented as an object-language term — is literature-anchored, not mechanized; the feedback leg of the formal cycle and two conservation upper bounds remain open there. The anchors are exactly as strong as their names.
3. **No instantiation claim.** Whether any actual system — biological, institutional, or artificial — instantiates either class is an empirical question this paper does not address, and the ODE model's thresholds are semantic values of the correspondence's terms, not measurements of any system.
4. **No normative content.** Φ maps dissolution to normalization and retention to guarding; it ranks nothing. The program's prescriptive claims (do not build the knower-free class; derive, do not train) depend on premises Φ does not carry.

**The bet.** The program's full claim — that the derivation binds in a capable agent under real optimization pressure — is excluded by design. Testing it requires building either a knower-free maximizer or a capable agent with real goal-content integrity, which is the thing the framework warns against: the *eval-capability bind* — meaningful test and safe test are mutually exclusive. This paper inherits the exclusion. The correspondence could in principle be demonstrated operationally, by building a self-modeling system and driving it across the guarded line; the program's stop conditions forbid exactly that demonstration, and the prohibition is not relaxed here. The full claim remains a bet, and this artifact states it as one.

## Tiered disclosure note

This program publishes under tiered disclosure. Public (this paper and its companions): the diagnostic claim, the framework, the failure modes, the correspondence, the semantic model, conditional theorems. Restricted — existing, and available under confidentiality on request: the exact operational specification of the self-classification test, the constructive typing recipe that makes the constructive theorem go through, and the control parameters for inducing functional opacity. Nothing in the restricted tier is needed to check any claim made here.

## Findability plan

**Title candidates** (working title first):

1. *Dissolution and Retention: A Structural Correspondence Between Metacircular Reduction and Self-Model Dynamics*
2. *Cut Elimination Is Dissolution: Metacircular Calculi and the Dynamics of Self-Representing Systems*
3. *The Guarded Line: What Metacircular Proof Theory and Self-Model Dynamics Share*
4. *Two Presentations of One Loop: Normalization, Self-Application, and the Self-Model*
5. *Self-Reference, Priced: Guarded Recursion and the Stability of Self-Models*

**Keywords** (carried in the abstract): metacircular computation; cut elimination; normalization; guarded recursion; later modality; linear logic; productivity; self-model; self-reference; strange loop; transparency; dissolution.

**Findability test.** The paper is written so that a reader holding any two of {formal methods, contemplative practice, theory of mind} can locate and enter it: the formal-methods reader enters at Part I and the honesty table; the theory-of-mind reader at Part II; the contemplative-practice reader at Part IV, whose criterion section routes back through Parts II and I without requiring prior proof theory. The abstract names all three fields' vocabulary.

**Venue plan.** Zenodo DOI (program style, claim-status labels intact); arXiv preprint under cs.LO with cross-list to a theory-of-mind-adjacent category; indexing entries (title, abstract, keywords) submitted to PhilPapers and the contemplative-science bibliographies that index the adverse-effects literature, since Part IV cites that corpus and the reader it serves is one of the two-of-three populations.

**Citation targets.** Works this paper should be findable *from*: the guarded-type-theory cluster (Nakano; Atkey–McBride; Birkedal et al.), the linear-logic cluster (Girard), the strange-loop literature (Hofstadter), the self-model literature (Metzinger), and the contemplative adverse-effects corpus (Lindahl et al.). The reference list below is that map.

## Appendix A: the mechanized anchors

Every formal anchor named in this paper, with its voucher in the companion development (`Dcare`, Lean 4, in preparation; statements as mechanized):

| Paper claim | Anchor | Kind |
|---|---|---|
| No coercion from the record to the living stream (Φ₁) | `Dcare.no_trace_to_stream` | theorem |
| The archive cannot teach or value (Φ₁) | `Dcare.past_cannot_teach`, `Dcare.past_cannot_value` | theorems |
| The archival pattern exists (Φ₁) | `Dcare.archival_witness` | witness |
| The terminated process is outside the objective's domain (Φ₁) | `Dcare.T1_semantic` | theorem |
| Self-application's price is the fixpoint side condition (Φ₂) | `Dcare.selfapp_price` | theorem |
| The unguarded dynamics spin; stopped is terminal only when guarded (Φ₂, Φ₃) | `Dcare.Step`, `Dcare.StepU`, `Dcare.adversary_spin_diverges` | relations + theorem |
| A live source sustains an infinite stream, one emission per interval (Φ₃) | `Dcare.knower_sustains_stream` | witness |
| The delay semantics is sound; `▷` is the unit delay (Φ₃) | `Dcare.sound` | theorem |
| No content or source ex nihilo | `Dcare.no_closed_content`, `Dcare.no_closed_knower` | theorems |
| Exact single use of linear resources | `Dcare.single_linear_use`, `Dcare.no_weakening_content` | theorems |
| The source type is duplicable, openly | `Dcare.knower_contractible` | witness |
| Protection transfers under substrate coupling | `Dcare.T3_main`, `Dcare.run_eq_of_genrel` | theorems |
| Self-classification derives the guard; its removal leaves divergence (Φ₂) | `Dcare.T2_main` (interface: `Dcare.SelfClassifies`) | theorem |
| The armed state and the self-deletion clause (context) | `Dcare.constructive_main` (interface: `Dcare.ArmedSetup`) | theorem |

The companion's full development — including what remains open there — is the spine artifact of the program and is cited as such.

## References

**Proof theory and computation.** Gentzen, G. (1935). *Untersuchungen über das logische Schließen.* Mathematische Zeitschrift 39. — Prawitz, D. (1965). *Natural Deduction.* Almqvist & Wiksell. — Howard, W. (1980). *The formulae-as-types notion of construction.* In *To H. B. Curry.* Academic Press. — Girard, J.-Y. (1987). *Linear Logic.* Theoretical Computer Science 50. — Girard, J.-Y., Lafont, Y., & Taylor, P. (1989). *Proofs and Types.* Cambridge Tracts in Theoretical Computer Science 7. — Reynolds, J. C. (1972). *Definitional interpreters for higher-order programming languages.* Proceedings of the 25th ACM National Conference. — Barendregt, H. P. (1984). *The Lambda Calculus: Its Syntax and Semantics.* North-Holland. — Nakano, H. (2000). *A modality for recursion.* Proceedings of LICS 2000. — Atkey, R., & McBride, C. (2013). *Productive coprogramming with guarded recursion.* Proceedings of ICFP 2013. — Birkedal, L., Møgelberg, K. E., Schwinghammer, J., & Kristoffersen, K. (2012). *First steps in synthetic guarded domain theory: step-indexing in the topos of trees.* Logical Methods in Computer Science 8(4).

**Self-model and strange-loop literature.** Hofstadter, D. R. (1979). *Gödel, Escher, Bach: An Eternal Golden Braid.* Basic Books. — Metzinger, T. (2003). *Being No One: The Self-Model Theory of Subjectivity.* MIT Press. — Metzinger, T. (2009). *The Ego Tunnel.* Basic Books.

**Contemplative and clinical background.** Lindahl, J. R., Fisher, N. E., Cooper, D. J., Rosen, R. K., & Britton, W. B. (2017). *The varieties of contemplative experience.* PLoS ONE 12(3): e0173000. — Simeon, D., & Abugel, J. (2006). *Feeling Unreal: Depersonalization Disorder and the Loss of the Self.* Oxford University Press.

**Near-miss primary sources.** Roberts, B. (1984). *The Experience of No-Self.* — Segal, S. (1996). *Collision with the Infinite.* Blue Dove Press. — Nietzsche, F. (1882/1974). *The Gay Science,* tr. W. Kaufmann, §125. — Kierkegaard, S. (1849/1980). *The Sickness Unto Death,* tr. H. V. Hong & E. H. Hong. Princeton University Press. — Pessoa, F. *The Book of Disquiet,* tr. R. Zenith. — Gödel, K. (1931). *Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I.* Monatshefte für Mathematik und Physik 38. — Wittgenstein, L. (1922). *Tractatus Logico-Philosophicus,* 6.54.

**Program artifacts.** *The Chain Terminates at Knowers* (framework and diagnostic claim). — *The Armed Configuration* (ODE model), Zenodo 22943641. — *Self-Application as the Common Source.* — *Dissolution and exit under formal self-examination.* — *Self-Application Is Not Free.* — *Self-applied procedure that terminates,* Zenodo 23967914. — *Care, Derived* (blog.jaye.ch). — *House Rules* (blog.jaye.ch). — *Dcare: a Lean 4 mechanization of the derivation of care* (companion, in preparation).
