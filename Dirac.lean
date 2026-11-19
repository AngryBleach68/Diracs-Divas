import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Tactic


theorem Dirac (G : SimpleGraph V) (FinType V) (hvgeq3 : V.card ≥ 3) (hdeg : ∀ v : V, G.degree v ≥ V.card / 2) : G.isHamiltonian := by

  --Let P be a maxium path in G, v1 ... vk
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
