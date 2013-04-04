#lang racket

(define (cuboid_route limit)
  (define (looper a c bc)
    (cond ((>= bc (* 2 a)) c)
          ((not (eq? (modulo (* bc a) 12) 0)) (looper a c (+ bc 1)))
          ((eq? (sqrt (+ (* bc bc) (* a a))) (integer-sqrt (+ (* bc bc) (* a a))))
           (looper a (+ c (- (min bc (+ a 1)) (/ (+ bc 1) 2))) (+ bc 1)))
          (#t (looper a c (+ bc 1)))))                  
  (define (helper a c)
    (if (>= c limit) a
        (helper (+ a 1) (looper a c 3))))
  (helper 3 0))