;; DO NOT CHANGE THESE TESTS.

;; Module to include testing code
(use-modules (srfi srfi-64))



(test-assert "gen-big-lazy-if-never-returns-likely-implemented-eager-list"
     (gen-lazy-list 1 1000000000000)) ; this shouldn't hang

(test-assert "gen-list-exists" (lambda () gen-list))
(test-equal "gen-list-many" '(1 2 3 4 5 6 7 8 9 10) (gen-list 1 10))
(test-equal "gen-list-single" '(3) (gen-list 3 3))
(test-equal "gen-list-empty" '() (gen-list 5 3))
(test-assert "pair-sum-exists" (lambda () pair-sum?))
(test-equal "pair-sum-first-two" #t (pair-sum? '(1 2 3) 3))
(test-equal "pair-sum-last-two" #t (pair-sum? '(1 2 3) 5))
(test-equal "pair-sum-nonexistent"  #f (pair-sum? '(1 2 3) 1))
(test-equal "pair-sum-big-true" #t (pair-sum? (gen-list 1 100) 199))
(test-equal "pair-sum-big-false" #f (pair-sum? (gen-list 1 100) 201))
(test-equal "pair-sum-small-true" #t (pair-sum? (gen-list 1 10) 17))
(test-equal "pair-sum-small-false" #f (pair-sum? (gen-list 1 10) 32))
(test-assert "pair-sum-lazy-exists" (lambda () pair-sum-lazy?))
(test-equal "pair-sum-lazy-first-two" #t (pair-sum-lazy? (gen-lazy-list 1 3) 3))
(test-equal "pair-sum-lazy-last-two" #t (pair-sum-lazy? (gen-lazy-list 1 3) 5))
(test-equal "pair-sum-lazy-nonexistent" #f (pair-sum-lazy? (gen-lazy-list 1 3) 1))
(test-equal "pair-sum-lazy-big-true" #t (pair-sum-lazy? (gen-lazy-list 1 100) 199))
(test-equal "pair-sum-lazy-big-false" #f (pair-sum-lazy? (gen-lazy-list 1 100) 201))
(test-equal "pair-sum-lazy-small-true" #t (pair-sum-lazy? (gen-lazy-list 1 10) 17))
(test-equal "pair-sum-lazy-small-false" #f (pair-sum-lazy? (gen-lazy-list 1 10) 32))
