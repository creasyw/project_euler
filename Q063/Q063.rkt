#lang racket

;; import num->intlst
(require "../list.rkt")

(define (qualify? a b)
  (= b (length (num->intlst (expt a b)))))

(define (q063)
  (foldl + 0
         (for*/list ((a (in-range 1 100))
                     (b (in-range 1 100)))
           (if (qualify? a b) 1 0))))