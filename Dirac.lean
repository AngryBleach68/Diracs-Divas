import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Combinatorics.SimpleGraph.Hamiltonian

-- Notion of a path with arbitrary endpoints. Called using Sigma (SomePath G) - 'Sigma' means we
-- don't care about what the endpoints are. In order to access 'Path' attribute of P,
-- must write P.snd && P.fst will give pair (u, v) of endpoints.
def SomePath {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) (endpoints : V × V)
: Type :=
    G.Path endpoints.fst endpoints.snd

def MaximumPath {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V} (P : Sigma (SomePath G))
: Prop :=
    ∀ Q : Sigma (SomePath G), P.snd.val.length ≥ Q.snd.val.length

-- TODO: prove that if G is a graph with edges then G has a maximum path.
theorem exists_max_path {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hGnotempty : G.edgeSet.Nonempty)
    : ∃ P : Sigma (SomePath G), MaximumPath P := by
    sorry

-- TODO: prove that for any graph with a path, the set of vertices of the path
-- has cardinality at most |V|
theorem pathLengthLeV {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (P : Sigma (SomePath G))
    : P.snd.val.support.length ≤ Fintype.card V := by
        sorry

-- TODO: prove this 'set-valued function' variation of the pigeonhole principle.
-- Possible direction: Finset.exists_mem_exists_mem_inf'_card_lt (can't figure out how to use it...)
theorem pigeonhole_variant [Fintype A] [Fintype B] (f : A → Finset B)
(h₀ : Fintype.card A = 2) (h : ∀ i : A, Fintype.card (f i) ≥ Fintype.card B / 2) :
    ∃ i : B, ∀ j : A, i ∈ (f j) := by
    sorry

-- variable {V : Type}
-- variable (Red Green : Set V)

theorem Dirac {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hvgeq3 : Fintype.card V ≥ 3) [∀ v : V, Fintype (G.neighborSet v)]
    (hdeg : ∀ v : V, 2 * SimpleGraph.degree G v ≥ Fintype.card V)
    : SimpleGraph.IsHamiltonian G := by

    have hExistsMaxPath : ∃ P : Sigma (SomePath G), MaximumPath P := by

        have hGnonempty : G.edgeSet.Nonempty := by
          -- Prove vertex set is nonempty by 'omega' tactic (tactic for inequalities over integers)
          have hvNonempty : Nonempty V := by
            apply Fintype.card_pos_iff.mp
            omega

          -- As V is nonempty can pick a vertex v
          rcases hvNonempty with ⟨v⟩

          -- Show v has positive degree via omega
          have hdeg_pos : 0 < G.degree v := by
            have := hdeg v
            omega

          -- obtain is concat of 'have' & 'rcases' tactic (prove statement, then unfold proof)
          -- Proof of neighborhood of v being non empty gives a vx u in v's neighborhood.
          obtain ⟨u, hu⟩ := Finset.card_pos.mp hdeg_pos

          -- <=> Equiv. to u & v being adjacent
          rw [SimpleGraph.mem_neighborFinset] at hu

          -- Provide u, v & proof of adjacency - shows edgeset is nonempty.
          exact ⟨s(v, u), hu⟩

        exact exists_max_path G hGnonempty

    -- rcases recursively unfolds 'there exists' statement in hypothesis to give a maximum path P
    rcases hExistsMaxPath with ⟨P, hPIsMaxPath⟩

    -- vertices in P
    let P_vert_list := P.snd.val.support

    sorry
    -- might need to 'unfold' these to see the actual property they represent
    -- let Red : Set V := sorry
    -- let Green : Set V := sorry
    -- have existsredandgreenvi : ∃ v : V, v ∈ Red ∧ v ∈ Green := by
    --     sorry

    -- sorry

  --Let P be a maxium path in G, v1 ... vk
  -- G.Path u v
  -- have k <= n
  -- All neighbours of V1 and vk are in teh path , contra
  --
  --Label vxs red and green / add to subsets
  -- red if vi connected to vk, green if vi+1 connected to v1
  -- PIgeonhole for red and green circle
  -- At least n/2 vxs have v_iv_k in E as all neighbours of v_k in P
  -- by construction no green circle around vk
  -- At least n/2 are connected to v_1 similarly
  -- v_k cannot have  a red circle (by construction)
  -- So we have <= n-1 vxs and two colours where each colour is goven to n/2
  -- use Finset.exists_mem_exisits_mem_inf'_card_lt
  --
  --
  -- Proving there is a simple cycle:
  -- Travel from v1 to vi along P
  -- From vi to vk by the edge guaranteed by green circle
  -- Backwards along P from vk to v_{i+1}
  -- Directly from v_{i+1} to 1 by red circle
