(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (not (= (and A (or B C))
                (or (and A B) (and A C)))))

(check-sat)

; Ergebnis: Die Negation der Formel 3a ist unsat, demnach ist 3a Tautologie