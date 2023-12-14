; 3a-tautology.smt2
(set-logic ALL)
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; Hier überprüfen wir die Negation der Formel
; Wenn der Solver "unsat" zurückgibt, bedeutet dies, dass die Negation der Formel nie wahr sein kann, 
; also ist die ursprüngliche Formel allgemeingültig. 
(assert (not (= (and A (or B C)) (or (and A B) (and A C)))))

(check-sat)
