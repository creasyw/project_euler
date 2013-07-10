#lang racket

;; import num->intlst
(require "../list.rkt")

(define (digit-sum n)
  (foldl + 0 (num->intlst n)))

(define (q056 limit)
  (define (helper a b sum)
    (cond ((= a limit) sum)
          ((= b limit) (helper (+ a 1) 1 sum))
          (#t (helper a (+ b 1) (max sum (digit-sum (expt a b)))))))
  (helper 2 2 0))

(q056 100)