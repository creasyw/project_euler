#lang racket

;; this is typlical for tree traversal

(define (coin-sum amount)
  (let ((lst (list 200 100 50 20 10 5 2 1)))
    (define (helper val left)
      (cond ((null? (cdr left)) 1)
            ((< 0 (- val (car left))) (+ (helper val (cdr left))
                                         (helper (- val (car left)) left)))
            ((= 0 (- val (car left))) (+ 1 (helper val (cdr left))))
            (#t (helper val (cdr left)))))
    (helper amount lst)))

(coin-sum 200)