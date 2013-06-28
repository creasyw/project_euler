#lang racket

;; import factorization
(require "../factor.rkt")

(define (q047 len)
  (define (helper acc result)
    (cond ((= len (length result)) result)
          ((= len (length (set->list (list->set (factorization acc)))))
           (helper (+ acc 1) (cons acc result)))
          (#t (helper (+ 1 acc) '()))))
  (last (helper 10 '())))