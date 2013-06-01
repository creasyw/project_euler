#lang racket

(define (digit-fab n)
  (let ((limit (expt 10 (- n 1))))
    (define (helper a b count)
      (let ((fab (+ a b)))
        (if (>= (quotient fab limit) 1) count
            (helper b fab (+ count 1)))))
;; the '3' indicate the next fab number will be the third term
    (helper 1 1 3)))

(digit-fab 1000)