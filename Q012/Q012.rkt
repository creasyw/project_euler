#lang racket
(require "../factor.rkt")

(define (div-tri-num numofdiv)
  (define (helper num acc)
    (if (> (length (factors num)) numofdiv) num
        (helper (+ num acc) (+ acc 1))))
  (helper 1 2))