(set-logic ALL)

(declare-const Alex Bool)
(declare-const Chris Bool)

(assert (= Alex (and Alex Chris)))
(assert (=> Chris Chris))

(check-sat)
(get-model)

; Chris Aussage ist eine Tautologie, da er als Schurke nicht sagen, dass er als Ritter immer die
; Wahrheit sagen würde. Damit würde er als Schurke die Wahrheit sagen, was nicht möglich ist. 
; Also muss 

; Alex kann jetzt auch ein Ritter sein und somit die Wahrheit sagen oder auch Schurke sein und
; lügen dass beide Ritter sind, da er der Schurke ist

; sat gibt also an, dass es einen Fall geben kann, wo beide Ritter sind
; Die Lösung ist aber nicht eindeutig