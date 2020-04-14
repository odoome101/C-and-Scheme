(define gen-list
  (lambda (start stop)
  (if (> start stop) '()
  (cons start (gen-list (+ start 1) stop)))
   )
  )

 (define pair-sum?
   (lambda (lst val)
   (cond 
     ((null? lst) #f)
     ((= (length lst) 1) #f)
     ((eq? val (+ (car lst) (car (cdr lst)))) #t)
     (else  (pair-sum? (cdr lst) val )))
   )
   )

(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))
  

  
  (define pair-sum-lazy?
   (lambda (lst val)
    (cond 
     ((null? lst) #f)
     ((not (number? (car lst))) #f)
     ((eq? val (+ (car lst) (car ((cdr lst))))) #t)
     (else  (pair-sum-lazy? ((cdr lst)) val )))
   )
   )
 
 