import Dirac.Basic
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.Pigeonhole
import Mathlib.Tactic


theorem Dirac (G : SimpleGraph V) (FinType V) (hvgeq3 : V.card ≥ 3) (hdeg : ∀ v : V, G.degree v ≥ V.card / 2) : G.isHamiltonian := by
