#lang racket
(provide num->intlst)

;; returns a list of integers containing every digit of the "num"
(define (num->intlst num)
  (let ((temp (string->list (number->string num))))
    (define (helper lst acc)
      (if (null? lst) (reverse acc)
          (helper (cdr lst) (cons (- (char->integer (car lst)) (char->integer #\0)) acc))))
    (helper temp '())))