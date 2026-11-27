import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Combinatorics.SimpleGraph.Hamiltonian

def Path' {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) :=
    Σ (u v : V), G.Path u v

def path'_length {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V} (P : Path' G)
    := P.2.2.val.length

-- def MaximumPathBetween {V : Type} [Fintype V] [DecidableEq V] (a b : V) (G : SimpleGraph V) (P : G.Path a b) : Prop :=
--     ∀ Q : G.Path a b, P.val.length ≥ Q.val.length

def MaximumPath {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V} (P : Path' G) : Prop :=
    ∀ Q : Path' G, path'_length P ≥ path'_length Q

theorem existsMaximumPath {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hvgeq2 : Fintype.card V ≥ 2) (hGnonempty : G.edgeSet.Nonempty)
    : ∃ P : Path' G, MaximumPath P := by

    sorry

theorem PathLengthLeV {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (P : Path' G)
    : path'_length P ≤ Fintype.card V := by
        sorry

-- variable {V : Type}
-- variable (Red Green : Set V)

theorem Dirac {Red Green : Set V} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hvgeq3 : Fintype.card V ≥ 3) [∀ v : V, Fintype (G.neighborSet v)]
    (hdeg : ∀ v : V, SimpleGraph.degree G v ≥ Fintype.card V / 2)
    : SimpleGraph.IsHamiltonian G := by

    have hExistsMaxPath : ∃ P : Path' G, MaximumPath P := by
        have hGnonempty : G.edgeSet.Nonempty := by
            sorry
        have hvgeq2 : Fintype.card V ≥ 2 := by
            sorry
        exact existsMaximumPath G hvgeg2 hGnonempty

    rcases hExistsMaxPath with ⟨P, hPIsMaxPath⟩

    let P_vlist := P.2.2.val.support

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
