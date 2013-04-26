#lang racket

(define (multiple limit ft1 ft2)
  (define (helper val acc)
    (cond ((>= val limit) acc)
          ((= 0 (modulo val ft1)) (helper (+ val 1) (+ val acc)))
          ((= 0 (modulo val ft2)) (helper (+ val 1) (+ val acc)))
          (#t (helper (+ val 1) acc))))
  (helper 1 0))

