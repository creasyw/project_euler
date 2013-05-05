#lang racket

(require "../text_processing.rkt")

(provide largest-product)

(define (stlist->numlist slst)
  (if (null? slst) '()
      (cons (- (char->integer (car slst)) (char->integer #\0)) (stlist->numlist (cdr slst)))))

(define (largest-product nlst num)
  (define (helper lst acc)
    (if (> num (length lst)) acc
        (letrec ((product (foldl * 1 (take lst num))))
          (helper (cdr lst)
                  (if (> acc product) acc product)))))
  (helper (list-tail nlst num) (foldl * 1 (take nlst num))))

; (largest-product (stlist->numlist (concatenate-number (next-row "Q008.txt"))) 5)