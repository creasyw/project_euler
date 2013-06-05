#lang racket

(define (equal? num pow)
  (define (sum-digit left acc)
    (if (= left 0) acc
        (sum-digit (quotient left 10) (+ acc (expt (remainder left 10) pow)))))
  (= num (sum-digit num 0)))

(define (digit-power ub pow)
  (define (helper i result)
    (cond ((> i ub) result)
          ((equal? i pow) (helper (+ i 1) (+ result i)))
          (#t (helper (+ i 1) result))))
  (helper 10 0))

(digit-power 999999 5)