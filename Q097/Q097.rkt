#lang racket

(define (huge-exp bot exp last)
  (letrec ((step 100)
           (mod (expt 10 last)))
    (define (helper result acc)
      (if (< (- exp acc) step)
          (remainder (* result (expt bot (- exp acc))) mod)
          (helper (remainder (* result (expt bot step)) mod) (+ acc step))))
    (helper 1 0)))

(define (q097)
  (letrec ((mod (expt 10 10)))
    (remainder (+ (* 28433 (huge-exp 2 7830457 10)) 1) mod)))

(displayln (q097))