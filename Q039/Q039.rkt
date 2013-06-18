#lang racket

(require "../number.rkt")

(define (int-right-triangles limit)
  (define (helper count max result)
    (if (= count limit) result
        (let ((temp (num-of-pythagorean count)))
          (if (> temp max)
              (helper (+ count 1) temp count)
              (helper (+ count 1) max result)))))
  (helper 3 1 2))