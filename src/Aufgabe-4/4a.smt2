(set-logic ALL)

; Kodierung:
; alex: Alex ist Ritter, ~alex: Alex ist Schurke
; chris: Chris ist Ritter, ~chris: Chris ist Schurke

(declare-const alex Bool)
(declare-const chris Bool)

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

; Schließe erste Lösung {chris -> true, alex -> false} aus.
; (assert (not (and chris (not alex))))

; Schließe auch die zweite Lösung {chris -> true, alex -> true} aus.
; Liefert unsat, da alle Möglichkeiten bereits ausgeschöpft.
; (assert (not (and chris alex)))

(check-sat)
(get-model)

; Ergebnis: Chris ist Ritter und Alex ist Schurke.
; Die Lösung ist nicht eindeutig, denn es können auch beide Ritter sein.