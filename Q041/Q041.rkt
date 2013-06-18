#lang racket

;; import prime?
(require "../prime.rkt")
;; import permuations
;; import intlst->num
(require "../list.rkt")

;; because it search in the range of 1-999999999, the "brutal force"
;; gen-prime would consume huge of memory...
(define (q041 digits)
  (define (looper itr)
    (cond ((null? itr) #f)
          ((prime? (car itr)) (car itr))
          (#t (looper (cdr itr)))))
  (define (helper current)
    (letrec ((lst (map (lambda (x) (intlst->num x))
                       (permutations (range 1 (+ current 1)) current)))
             ;; sorting to make sure the max prime is found at each iteration
             (val (looper (sort lst >))))
      (cond ((= current 1) 1)
            (val val)
            (#t (helper (- current 1))))))
  (helper digits))

