(set-logic ALL)

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

; Evelyn sagt genau dann die Wahrheit (und ist somit Ritter),
; wenn sie ein Schurke ist.
(assert (= evelyn
           (not evelyn)))

(check-sat)

; Ergebnis: unsat. Es gibt keine Belegung der Variablen, sodass die 
; Forderungen erfüllt werden. Die ersten drei Teilformeln fordern, 
; dass Evelyn ein Ritter ist - sie also die Wahrheit sagt. Demnach 
; muss Evelyn bei der letzten Teilformel die Wahrheit sagen und 
; tatsächlich kein Ritter sein. Da nach der Aufgabenstellung 
; Evelyn nicht gleichzeitig Ritter und Schurke sein kann, gibt es 
; keine Möglichkeit die ganze Formel zu erfüllen.