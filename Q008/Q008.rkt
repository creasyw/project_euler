#lang racket

(require "../text_processing.rkt")

(define (stlist->numlist slst)
  (if (null? slst) '()
      (cons (- (char->integer (car slst)) (char->integer #\0)) (stlist->numlist (cdr slst)))))

(define (largest-product nlst)
  (define (helper lst acc)
    (if (> 5 (length lst)) acc
        (letrec ((product (foldl * 1 (take lst 5))))
          (helper (cdr lst)
                  (if (> acc product) acc product)))))
  (helper (list-tail nlst 5) (foldl * 1 (take nlst 5))))

(largest-product (stlist->numlist (concatenate-number (next-row "Q008.txt"))))