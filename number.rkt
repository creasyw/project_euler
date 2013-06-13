#lang racket

;; import intlst->num
;; import num->intlst
(require "list.rkt")

(provide factorial)
(provide decimal->binary)
(provide binary->decimal)

(define (factorial n)
  (if (<= n 1) 1
      (foldl * 1 (range 2 (+ n 1)))))

(define (decimal->binary num)
  (define (helper n acc)
    (if (= n 1) (intlst->num (cons 1 acc))
        (helper (quotient n 2) (cons (remainder n 2) acc))))
  (helper num '()))

(define (binary->decimal num)
  (let ((nlst (reverse (num->intlst num))))
    (define (helper lst count acc)
      (if (null? lst) acc
          (helper (cdr lst) (+ count 1) (+ acc (* (car lst) (expt 2 count))))))
    (helper nlst 0 0)))