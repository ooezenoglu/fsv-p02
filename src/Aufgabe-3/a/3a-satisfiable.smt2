(set-logic ALL)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assert (= (and A (or B C))
           (or (and A B) (and A C))))

(check-sat)
(get-model)

; Ergebnis: Formel 3a ist sat mit Belegung {A -> true, B -> true, C -> true}