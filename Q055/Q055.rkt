#lang racket

;; import palindromic?
;; import reverse-number
(require "../number.rkt")

(define (q055 limit)
  (letrec ((ub 50))
    (define (not-lychrel? count current)
      (and (< count 50)
           (let ((next (+ current (reverse-number current))))
             (or (palindromic? next)
                 (not-lychrel? (+ count 1) next)))))
    (define (helper count acc)
      (cond ((= count limit) acc)
            ((not-lychrel? 1 count) (helper (+ count 1) acc))
            (#t (helper (+ count 1) (+ acc 1)))))
    (helper 2 0)))

(q055 10000)