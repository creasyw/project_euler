#lang racket

;21 22 23 24 25
;20  7  8  9 10
;19  6  1  2 11
;18  5  4  3 12
;17 16 15 14 13
;
;The table is quite systematic ligned
;#layer:         0      1      2     ...   n
;side-length:    1      3      5     ...  2n+1
;                a1    a1+2   a5+4         ...
;                      a2+2   a6+4         ...
;                      a3+2   a7+4         ...
;                      a4+2   a8+4       a_(4n)+2n

(define (diagonal-sum length)
  (let ((layer (/ (+ length 1) 2)))
    (define (helper count pre result)
      (if (= count layer) result
          ;; the step for corner to corner is 2n, so it is 8n from the 1st to the 4th
          ;; the increase of summation will be (1+2+3+4)*step = 10*(2n) = 20n
          (helper (+ count 1) (+ pre (* count 8)) (+ result (* pre 4) (* count 20)))))
    (helper 1 1 1)))

(diagonal-sum 1001)