#lang racket

;; import num->intlst
(require "../list.rkt")
;; import decimal->binary
(require "../number.rkt")

(define (palindrome? num)
  (let ((nlst (num->intlst num)))
    (equal? nlst (reverse nlst))))

(define (main limit)
  (define (helper count acc)
    (cond ((= count limit) (foldl + 0 acc))
          ((and (palindrome? count)
                (palindrome? (decimal->binary count)))
           (helper (+ count 1) (cons count acc)))
          (#t (helper (+ count 1) acc))))
  (helper 1 '()))