; 3b-satisfiable.smt2
(set-logic QF_LIA)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; (A ∧ B) => ((¬(C => A)) ∨ (B => A))
(assert (=> (and A B) (or (not (=> C A)) (=> B A))))

(check-sat)
(get-model)
