#lang racket

(define (difference n)
  (define (square-sum num acc)
    (if (= num 1) (+ acc 1)
        (square-sum (- num 1) (+ acc (* num num)))))
  (define (sum-square num acc)
    (if (= num 1) (* (+ acc 1) (+ acc 1))
        (sum-square (- num 1) (+ acc num))))
  (- (sum-square n 0) (square-sum n 0)))
