#lang racket

;; for this specific question, input all of the choice into the function of
;; permutation might be the 'brutal-force' way to solve it, but it is also
;; very memory consuming. Given the uniqueness and sorted arrangement, 
;; counting the number of permutation one by one digit is much faster.

(define (factorial n)
  (foldl * 1 (range 2 (+ n 1))))

(define (lex-permutation upper lower rank)
  (let ((lst (range lower (+ upper 1))))
    (define (helper left-lst left-rank acc)
      (letrec ((fac (factorial (- (length left-lst) 1)))
               (index (quotient left-rank fac)))
        ;(current (list-ref left-lst index)))
        (cond ((<= left-rank 0) (append acc left-lst))
              ((<= index 0) (helper (cdr left-lst) left-rank 
                                   (append acc (list (car left-lst)))))
              (#t (let ((current (list-ref left-lst index)))
                    (helper (remove current left-lst)
                            (remainder left-rank fac)
                            (append acc (list current))))))))
    (helper lst (- rank 1) '())))

; test
;(define upper 4)
;(for ((i (in-range 1 (+ (factorial upper) 1))))
;  (displayln (lex-permutation (- upper 1) 0 i)))

(lex-permutation 9 0 1000000)