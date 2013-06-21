#lang racket

;; For pentagonal, num = n(3n-1)/2 ==> n = (1+(1+24*num)**0.5)/6
(define (pentagonal? n)
  (integer? (/ (+ 1 (sqrt (+ 1 (* 24 n)))) 6)))

;; For triangle, num = n(n+1)/2 ==> n = ((1+8*num)**0.5-1)/2
(define (triangle? n)
  (integer? (/ (- (sqrt (+ 1 (* 8 n))) 1) 2)))

;; Generating hexagonal number will have the fewest times of testing
(define (gen-hexagonal n)
  (* n (- (* 2 n) 1)))

(define (q045 time)
  (define (helper count acc)
    (let ((hex (gen-hexagonal acc)))
      (if (and (pentagonal? hex) (triangle? hex))
          (if (= count time) hex
              (helper (+ count 1) (+ acc 1)))
          (helper count (+ acc 1)))))
  (helper 1 140))