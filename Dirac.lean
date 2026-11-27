import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Combinatorics.SimpleGraph.Hamiltonian

def MaximalPathBetween {V : Type} [Fintype V] [DecidableEq V] (a b : V) (G : SimpleGraph V) (P : G.Path a b) : Prop :=
    ∀ Q : G.Path a b, P.val.length ≥ Q.val.length

def IsMaximalPath {V : Type} [Fintype V] [DecidableEq V] {a b : V} {G : SimpleGraph V} (P : G.Path a b): Prop :=
    ∀ u v : V, ∀ Q : G.Path u v, P.val.length ≥ Q.val.length

lemma PathLengthIsAtMostCardV {V : Type} [Fintype V] {a b : V} {G : SimpleGraph V} (hvgeq3 : Fintype.card V ≥ 3):
    ∀ P : G.Path a b, P.val.length ≤ Fintype.card V := by
    intro P
    sorry

lemma FiniteGraphHasMaximalPath {V : Type} [Fintype V] [DecidableEq V] {G : SimpleGraph V} :
    ∃ a b : V, ∃ P : G.Path a b, IsMaximalPath P := by
    sorry

theorem Dirac {V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) (hvgeq3 : Fintype.card V ≥ 3)
[∀ v : V, Fintype (G.neighborSet v)] (hdeg : ∀ v : V, SimpleGraph.degree G v ≥ Fintype.card V / 2) {a b : V}
: SimpleGraph.IsHamiltonian G := by
    let P : G.Path a b := sorry
    let GreenSet := {v : V // G.Adj v a}
    -- let RedSet := {v : V // v ∈ P.val.support ∧ v ≠ P.val.support.getLast ∧ G.Adj P.val.support[P.val.support.findIdx v + 1]] a}
    sorry
  --Let P be a maximum path in G, v1 ... vk
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
