(set-logic ALL)

(set-option :produce-models true)

; Kodierung:
; alex: Alex ist Ritter, ~alex: Alex ist Schurke
; chris: Chris ist Ritter, ~chris: Chris ist Schurke
; evelyn: Evelyn ist Ritter, ~evelyn: Evelyn ist Schurke

(declare-const alex Bool)
(declare-const chris Bool)
(declare-const evelyn Bool)

; Alex sagt genau dann die Wahrheit (und ist somit Ritter),
; wenn seine Aussage "Wir sind beide Ritter" wahr ist.
(assert (= alex 
           (and alex chris)))

; Chris sagt genau dann die Wahrheit (und ist somit Ritter),
; wenn seine Aussage "Wenn ich Ritter bin dann spreche ich die Wahrheit"
; wahr ist. Die Aussage lässt sich zu chris = true vereinfachen (also
; muss Chris ein Ritter sein).
(assert (= chris
           (=> chris chris)))

; Evelyn sagt genau dann die Wahrheit (und ist somit Ritter),
; wenn ihre Aussage "Wenn ich Ritter bin, dann ist Alex Schurke"
; wahr ist.
(assert (= evelyn
           (=> evelyn (not alex))))

; Schließe erste Lösung {chris -> true, evelyn -> true, alex -> false} aus.
; Liefert unsat, da es nur eine Möglichkeit gab.
; (assert (not (and chris evelyn (not alex))))

(check-sat)
(get-model)

; Ergebnis: Chris und Evelyn sind Ritter und Alex ist Schurke.
; Die Lösung ist eindeutig.
