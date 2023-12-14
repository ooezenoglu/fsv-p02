; 4c.smt2
(set-logic ALL)

(declare-const Alex Bool)
(declare-const Chris Bool)
(declare-const Evelyn Bool)


(assert (= Alex (and Alex Chris)))
(assert (=> Chris Chris))
(assert (not Evelyn))

(check-sat)
(get-model)

; Evelyns Aussage ist ein  Paradoxon.
; Wenn sie Ritter ist, muss sie die Wahrheit sagen und kann somit nicht sagen, dass sie kein Ritter ist.
; Wenn sie ein Schurke ist, muss sie lügen und kann nicht sagen, dass sie kein Ritter ist, weil das der Wahrheit entsprechn würde
