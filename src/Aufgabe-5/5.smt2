(set-logic ALL)
(set-option :produce-models true)

(define-fun isPalindrome ((a (Array Int Int)) (l Int) (r Int)) Bool

; Diese 'forall'-Schleife überprüft, ob das Array 'a' zwischen den Indizes 'l' und 'r' ein Palindrom ist.
; 'i' durchläuft jeden Index im Array zwischen 'l' und 'r'.
; Für jeden Index 'i', wenn 'i' innerhalb des Bereichs ['l', 'r') ist überprüfen wir die Gleichheit
; Das Element bei 'i' (select a i) und das entsprechende Element am gegenüberliegenden Ende des Bereichs 
; (select a (- (+ r l) 1 i)) müssen gleich sein damit die Bedingung eines Palindroms erfüllt ist
(forall ((i Int)) 
    (=> (and (>= i l) (< i r))
        (= (select a i) (select a (- (+ r l) 1 i)))))

)


; SOME TESTCASES

(push)
(declare-const a (Array Int Int))

(assert (= (select a -3)   17))
(assert (= (select a -2)    2))
(assert (= (select a -1)    5))
(assert (= (select a  0)  999))
(assert (= (select a  1)    5))
(assert (= (select a  2)    2))
(assert (= (select a  3)   17))

(assert
    (not (isPalindrome a -3 4)))

(set-info :status unsat)
(check-sat)
(pop)


(push)
(declare-const a (Array Int Int))

(assert (= (select a -3)  1))
(assert (= (select a -2)  2))
(assert (= (select a -1)  3))
(assert (= (select a  0)  3))
(assert (= (select a  1)  2))
(assert (= (select a  2)  1))

(assert
    (not (isPalindrome a -3 3)))

(set-info :status unsat)
(check-sat)
(pop)

(push)
(declare-const a (Array Int Int))

(assert
    (not (isPalindrome a 42 42)))
(set-info :status unsat)
(check-sat)
(pop)

(push)
(declare-const a (Array Int Int))
(assert
    (not (isPalindrome a -1 0)))
(set-info :status unsat)
(check-sat)
(pop)

(push)
(declare-const a (Array Int Int))
(declare-const k Int)

(assert
    (not (isPalindrome a (- k) (+ k 1))))

(set-info :status sat)
(check-sat)
(pop)
