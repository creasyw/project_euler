#lang racket

;; import cyclic?
(require "../number.rkt")

(define (triangle n) (* n (+ n 1) 0.5))
(define (square n) (* n n))
(define (pentagonal n) (* n (- (* 3 n) 1) 0.5))
(define (hexagonal n) (* n (- (* 2 n) 1)))
(define (heptagonal n) (* n (- (* 5 n) 3) 0.5))
(define (octagonal n) (* n (- (* 3 n) 2)))

(define (within-range? x)
  (and (< x 10000) (> x 1000)))

(define (q061)
  (letrec ((limit 1000)
           (ndigits 2)
           (ht (make-hash)))
    (hash-set! ht 3 (filter within-range? (map triangle (range limit))))
    (hash-set! ht 4 (filter within-range? (map square (range limit))))
    (hash-set! ht 5 (filter within-range? (map pentagonal (range limit))))
    (hash-set! ht 6 (filter within-range? (map hexagonal (range limit))))
    (hash-set! ht 7 (filter within-range? (map heptagonal (range limit))))
    (hash-set! ht 8 (filter within-range? (map octagonal (range limit))))
    (define (dfs level acc current)
      (if (null? current) #f
          (if (not (cyclic? (last acc) (car current) ndigits))
              (dfs level acc (cdr current))
              (if (= level 8)
                  (if (cyclic? (car current) (first acc) ndigits)
                      (append acc (list (car current)))
                      (dfs level acc (cdr current)))
                  (let ((result (dfs (+ level 1) (append acc (list (car current)))
                       (hash-ref ht (+ level 1)))))
                      (if result result (dfs level acc (cdr current))))))))
    (define (helper lst)
      (let ((result (dfs 3 (list (car lst)) (hash-ref ht 4))))
        (if result result
            (helper (cdr lst)))))
    (helper (hash-ref ht 3))))
