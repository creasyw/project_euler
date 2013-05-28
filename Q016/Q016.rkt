#lang racket

;; returns the list containing every digit of the "num"
;; the "reverse" is not necessary for this question since it just
;; calculate the summation of the number
(define (num-to-intlist num)
  (let ((temp (string->list (number->string num))))
    (define (helper lst acc)
      (if (null? lst) (reverse acc)
          (helper (cdr lst) (cons (- (char->integer (car lst)) (char->integer #\0)) acc))))
    (helper temp '())))

(define (power-digit-sum num)
  (foldl + 0 (num-to-intlist num)))

(power-digit-sum (expt 2 1000))