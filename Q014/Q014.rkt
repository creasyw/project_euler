#lang racket

(define ht (make-hash))

(define (longest-chain limit)
  (define (count-chain acc count)
    (cond ((= acc 1) count)
          ((hash-has-key? ht acc) (+ (hash-ref ht acc) count))
          ((= 0 (modulo acc 2)) (count-chain (/ acc 2) (+ count 1)))
          (#t (count-chain (+ 1 (* 3 acc)) (+ count 1)))))
  (define (helper num result length)
    (if (>= num limit) result
        (let ((current (count-chain num 1)))
          (begin (hash-set! ht num current)
                 (if (> current length)
                     (helper (+ num 1) num current)
                     (helper (+ num 1) result length))))))
  (helper 2 1 0))

(longest-chain 1000000)