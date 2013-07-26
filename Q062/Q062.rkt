#lang racket

;; import num->intlst
;; import intlst->num
(require "../list.rkt")

(define (q062 limit begin-with)
  (define ht (make-hash))
  (define (helper acc)
    (letrec ((temp (expt acc 3))
             (key (intlst->num (sort (num->intlst temp) <))))
      (if (hash-has-key? ht key)
          (hash-set! ht key (cons temp (hash-ref ht key)))
          (hash-set! ht key (list temp)))
      (if (= limit (length (hash-ref ht key)))
          ;(hash-ref ht key)
          (first (sort (hash-ref ht key) <))
          (helper (+ acc 1)))))
  (helper begin-with))

(q062 5 3000)