#lang racket
(require "../factor.rkt")

(define amicable?
  (lambda (n)
    (letrec ((f1 (factors n))
             (n2 (foldl + 0 (take f1 (- (length f1) 1))))
             (f2 (factors n2)))
      (and (not (= n n2))
           (= n (foldl + 0 (take f2 (- (length f2) 1))))))))

(define (sum-amicable limit)
  (foldl + 0 (filter amicable? (range 2 limit))))

(sum-amicable 10000)