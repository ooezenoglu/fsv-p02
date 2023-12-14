(set-logic ALL)

(declare-const Alex Bool)
(declare-const Chris Bool)
(declare-const Evelyn Bool)


(assert (= Alex (and Alex Chris)))
(assert (=> Chris Chris))
(assert (=> Evelyn (not Alex)))

(check-sat)
(get-model)

; Jetzt haben wir drei Personen: Alex, Chris und Evelyn. Evelyns Aussage lautet, dass wenn sie
; ein Ritter ist, dann ist Alex ein Schurke. Dies fügen wir als eine neue Assertion hinzu.

; Durch Evelyns Aussage wird die Situation komplizierter,
; weil sie eine direkte Aussage über Alex macht.

; Wenn Evelyn ein Ritter ist (also die Wahrheit sagt), dann wissen wir, dass Alex ein Schurke sein muss.
; Wenn Evelyn aber ein Schurke ist, dann kann Alex entweder Ritter oder Schurke sein, da Evelyn dann
; lügt. Diese neue Bedingung muss zusammen mit den früheren Aussagen von Alex und Chris betrachtet
; werden.

; Es ist möglich, dass verschiedene Kombinationen von Rittern und Schurken existieren, die alle
; Aussagen erfüllen. Die Lösung ist also nicht unbedingt eindeutig und hängt von der Wahrheit von
; Evelyns Aussage ab. Wir müssen also alle möglichen Kombinationen überprüfen, um zu sehen, welche
; konsistent sind.
