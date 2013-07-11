#lang racket

(define (q057 limit)
  (define (helper count acc nu de)
    (if (= count limit) acc
        (letrec ((nup (+ de de nu))
                 (dep (+ de nu)))
          (if (> (string-length (number->string nup))
                 (string-length (number->string dep)))
              (helper (+ count 1) (+ acc 1) nup dep)
              (helper (+ count 1) acc nup dep)))))
  (helper 1 0 3 2))