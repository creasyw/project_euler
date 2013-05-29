#lang racket
(provide num-to-intlist)
(provide max-element)
(provide min-element)

;; returns a list of integers containing every digit of the "num"
(define (num-to-intlist num)
  (let ((temp (string->list (number->string num))))
    (define (helper lst acc)
      (if (null? lst) (reverse acc)
          (helper (cdr lst) (cons (- (char->integer (car lst)) (char->integer #\0)) acc))))
    (helper temp '())))

(define (max-element lst)
  (define (helper result rest)
    (if (null? rest) result
        (helper (max result (car rest)) (cdr rest))))
  (helper -inf.0 lst))

(define (min-element lst)
  (define (helper result rest)
    (if (null? rest) result
        (helper (min result (car rest)) (cdr rest))))
  (helper +inf.0 lst))