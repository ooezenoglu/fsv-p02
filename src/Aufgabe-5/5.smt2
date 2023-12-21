(set-logic ALL)

(define-fun
    isPalindrome ((a (Array Int Int)) (l Int) (r Int)) Bool
    
        (forall ((i Int))
            ; i ist ein Index um durch das Array zu iterieren (0 <= i < a.length).
            (=> (and (>= i 0) (< i (- r l)))
                ; Prüfe Gleichheit der Werte von außen nach innen.
                (= (select a (+ l i)) (select a (- r 1 i)))))
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
