; 3b-tautology.smt2
(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; (A ∧ B) => ((¬(C => A)) ∨ (B => A))
; Überprüfen die Allgemeingültigkeit mit der gleichen Logik wie in der a)
(assert (not(=> (and A B) (or (not (=> C A)) (=> B A)))))

(check-sat)
; unsat -> allgemeingültig