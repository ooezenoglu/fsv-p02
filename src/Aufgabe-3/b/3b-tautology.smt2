(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (not (=> (and A B)
                 (or (not (=> C A)) (=> B A)))))

(check-sat)

; Ergebnis: Die Negation der Formel 3b ist unsat, demnach ist 3b Tautologie