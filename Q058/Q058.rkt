#lang racket

;; import prime?
(require "../prime.rkt")

(define (q058 threshold)
  (define (helper side final all acc)
    (letrec ((lst (for/list ((i (in-range 1 5)))
                    (+ final (* i side))))
             (primes (filter prime? lst))
             (new_all (+ all 4))
             (new_acc (+ acc (length primes))))
      ;; in the algo. "side" is the difference between two diagonal element
      ;; so, the "real side" should be "side+1"
      (if (> threshold (/ new_acc new_all)) (+ side 1)
          (helper (+ side 2) (last lst) new_all new_acc))))
  (helper 2 1 1 0))

(q058 0.1)