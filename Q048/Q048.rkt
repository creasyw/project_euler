#lang racket

;; import num->intlst
(require "../list.rkt")

(define (q048 limit)
  (letrec ((lst (map (lambda (x) (expt x x)) (range 1 (+ limit 1))))
           (sum (num->intlst (foldl + 0 lst))))
    (intlst->num (drop sum (- (length sum) 10)))))