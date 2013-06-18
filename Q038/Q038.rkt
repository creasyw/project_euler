#lang racket

;; import num->intlist
(require "../list.rkt")
;; import pandigital?
(require "../number.rkt")

(define (pan-multiples? n)
  ;; any number in condition will be regarded as true
  ;; so this helper function returns either false or concatenated number
  (define (helper count acc)
    (let ((len (length acc)))
      (cond ((and (= len 9) (equal? (range 1 10) (sort acc <))) (intlst->num acc))
            ((>= len 9) #f)
            (#t (helper (+ count 1) (append acc (num->intlst (* count n))))))))
  (helper 1 '()))

(define (main)
  (let ((limit 10000000))
    (define (helper count result)
      (let ((returned (pan-multiples? count)))
        (cond ((> count limit) result)
              (returned (helper (+ count 1) (max result returned)))
              (#t (helper (+ count 1) result)))))
    (helper 2 0)))

(main)