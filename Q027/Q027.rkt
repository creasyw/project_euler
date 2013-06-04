#lang racket
;; import prime?
(require "../prime.rkt")

(define (longest-prime a b)
  (define (looper n)
    (letrec ((f (lambda (x) (+ (* x x) (* a x) b)))
             (val (f n)))
      ;; by default, prime? only deals with positive numbers
      (cond ((< val 0) 0)
            ((prime? val) (looper (+ n 1)))
            (#t n))))
  (looper 0))

(define (quadratic-primes alimit blimit)
  (define (helper ita itb maxlen ab)
    (cond ((= ita 1000) (* (car ab) (cdr ab)))
          ((= itb 1000) (helper (+ ita 1) (- (- blimit 1)) maxlen ab))
          (#t (let ((temp (longest-prime ita itb)))
                (if (> maxlen temp)
                    (helper ita (+ itb 1) maxlen ab)
                    (helper ita (+ itb 1) temp (cons ita itb)))))))
  (helper (- (- alimit 1)) (- (- blimit 1)) 0 (cons 0 0)))