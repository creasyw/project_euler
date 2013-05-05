#lang racket

(require "../text_processing.rkt")

(define (string->lst filename)
  (let ((st (next-row filename)))
    (define (process-string str acc)
      (if (null? str) (reverse acc)
          (process-string (cdr str) (cons (string->number (car str)) acc))))
    (define (helper acc)
      (let ((temp (st)))
        (if (null? temp) acc
            (helper (append acc (list (process-string (string-split (car temp)) '())))))))
    (helper '())))



;(define (largest-product filename sidelen)
;  (letrec ((lst (concatenate-number (next-row filename)))
;           (vlargest (vproduct lst))
;           (hlargest (hprodouct lst))
;           (dlargest (dproduct lst)))
;    (max (list vlargest hlargest dlargest))))
    
    