#lang racket

(provide factorization)

(define (factorization num)
  (define (extract-two n lst)
    (if (= 0 (modulo n 2)) (extract-two (/ n 2) (cons 2 lst)) lst))
  (define (helper n limit factor lst)
    (if (> factor limit)
        (if (not (= 1 n)) (cons n lst) lst)
        (if (= 0 (modulo n factor))
            (helper (/ n factor) limit factor (cons factor lst))
            (helper n limit (+ factor 2) lst))))
  (letrec ((lst (extract-two num '(1)))
           (left (/ num (foldl * 1 lst))))
    (list-tail (reverse (helper left (sqrt left) 3 lst)) 1)))