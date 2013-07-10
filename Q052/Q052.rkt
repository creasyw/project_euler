#lang racket

;; import num->intlst
(require "../list.rkt")


(define (same-digits? n ub)
  (letrec ((lst (sort (num->intlst n) <)))
    (define (helper count)
      (or (= count ub)
          (and (equal? lst (sort (num->intlst (* count n)) <))
               (helper (+ count 1)))))
    (helper 2)))

(define (q052 count)
  (let ((ub (+ count 1)))
    (define (helper acc)
      (if (same-digits? acc ub) acc
          (helper (+ acc 1))))
    (helper 2)))

(q052 6)