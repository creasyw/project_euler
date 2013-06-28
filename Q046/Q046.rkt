#lang racket

;; import gen-prime
(require "../prime.rkt")

(define (goldbach? num lst)
  ;; for some primes the goldbach solution is n = n + 2*0**2
  (and (>= num (car lst))
      (or (integer? (sqrt (/ (- num (car lst)) 2)))
          (goldbach? num (cdr lst)))))

(define (q046 limit)
  (let ((lst (gen-prime limit)))
    (define (helper acc)
      (and (< acc (last lst))
           (if (goldbach? acc lst) (helper (+ acc 2)) acc)))
    (helper 33)))