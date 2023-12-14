; 3b-satisfiable.smt2
(set-logic QF_LIA)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; (A ∧ B) => ((¬(C => A)) ∨ (B => A))
; Überprüfen die allgemeingültigkeit mit der gleichen logik wie in der a)
(assert (not(=> (and A B) (or (not (=> C A)) (=> B A)))))

(check-sat)
(get-model)
; unsat -> allgemeingültig 