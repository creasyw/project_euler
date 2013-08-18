#lang racket

;; import coprime
(require "../prime.rkt")

(define (q069 ulimit)
  (argmax cdr (map (lambda (x) (cons x (/ x (length (coprime x))))) (range 2 (+ 1 ulimit)))))

;; testing
;(q069 1000000)