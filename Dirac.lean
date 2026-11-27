import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Combinatorics.SimpleGraph.Hamiltonian

-- Notion of a path with arbitrary endpoints. Called using Sigma (SomePath G) - 'Sigma' means we
-- don't care about what the endpoints are. In order to access 'Path' attribute of P, must write P.snd
-- P.fst will give pair (u, v) of endpoints.
def SomePath {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) (endpoints : V × V) : Type :=
    G.Path endpoints.fst endpoints.snd

def MaximumPath {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V} (P : Sigma (SomePath G)) : Prop :=
    ∀ Q : Sigma (SomePath G), P.snd.val.length ≥ Q.snd.val.length

-- TODO: prove that if G is a graph with edges then G has a maximum path.
theorem exists_max_path {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hGnonempty : G.edgeSet.Nonempty)
    : ∃ P : Sigma (SomePath G), MaximumPath P := by
    sorry

-- TODO: prove that for any graph with a path, the length of this path is at most |V| - 1
-- (length of a walk is defined as no. of edges along it)
theorem pathLengthLeV {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (P : Sigma (SomePath G))
    : P.snd.val.length ≤ Fintype.card V - 1 := by
        sorry

-- theorem pigeonhole_variant [Fintype A] [Fintype B] [DecidableEq A] [DecidableEq B] (f : A → Finset B)
-- (h₀ : Fintype.card A = 2) (h₁ : ∀ i : A, Fintype.card (f i) ≥ Fintype.card B / 2) :
--     ∃ i : Set.image f, ∀ j : B, i ∈ (f j) := by
--     sorry

-- variable {V : Type}
-- variable (Red Green : Set V)

theorem Dirac {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hvgeq3 : Fintype.card V ≥ 3) [∀ v : V, Fintype (G.neighborSet v)]
    (hdeg : ∀ v : V, SimpleGraph.degree G v ≥ Fintype.card V / 2)
    : SimpleGraph.IsHamiltonian G := by

    -- TODO: show that G has edges.
    have hExistsMaxPath : ∃ P : Sigma (SomePath G), MaximumPath P := by
        have hGnonempty : G.edgeSet.Nonempty := by
            sorry
        exact exists_max_path G hGnonempty

    -- rcases recursively unfolds 'there exists' statement in hypothesis to give a maximum path P.
    rcases hExistsMaxPath with ⟨P, hPIsMaxPath⟩

    -- let P_vlist := P.2.2.val.support

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
