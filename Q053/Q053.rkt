#lang racket

;; import factorial
;; import 
(require "../number.rkt")

(define (combinatorics n r)
  (/ (factorial n) (factorial r) (factorial (- n r))))

(define (q053 threshold)
  (letrec ((limit 101))
    (define (helper count acc)
      (if (= count limit) acc
          (letrec ((bigger (length (filter (lambda (x) (> x threshold))
                                           (for/list ((i (in-range 1 (+ count 1))))
                                             (combinatorics count i))))))
            (helper (+ count 1) (+ acc bigger)))))
    (helper 1 0)))

(q053 1000000)