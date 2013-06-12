#lang racket

(define (factorial n)
  (foldl * 1 (range 1 (+ n 1))))

(define (digit-factorial num)
  (define (helper n acc)
    (if (< n 10) (+ acc (factorial n))
        (helper (quotient n 10) (+ acc (factorial (remainder n 10))))))
  (helper num 0))

(define (main limit)
  (define (helper n acc)
    (cond ((> n limit) acc)
          ((= n (digit-factorial n)) (helper (+ n 1) (+ acc n)))
          (#t (helper (+ n 1) acc))))
  (helper 3 0))

(main 99999)