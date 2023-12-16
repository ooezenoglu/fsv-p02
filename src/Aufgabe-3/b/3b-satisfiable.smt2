(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (=> (and A B)
            (or (not (=> C A)) (=> B A))))

(check-sat)
(get-model)

; Ergebnis: Formel 3b ist sat mit Belegung {A -> false, B -> false, C -> false}