#lang racket

;; import num->intlst
(require "../list.rkt")

(define (concatenate-num ind)
  (define (helper count acc)
    (letrec ((current (num->intlst count))
             (len (length current))
             (sum (+ acc len)))
      (if (> sum ind) (list-ref current (- len (- sum ind) 1))
          (helper (+ count 1) sum))))
  (helper 1 0))

(define (main)
  (let ((limit 1000000))
    (define (helper count result)
      (if (= limit count) (* result (concatenate-num count))
          (helper (* count 10) (* result (concatenate-num count)))))
    ;; begin at 10 because of 1 is unnecssary for multiply,
    ;; ... and the index of in function "concatenate-num" is -1.
    (helper 10 1)))

(main)