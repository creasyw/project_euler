#lang racket

; SOLUTION: From http://en.wikipedia.org/wiki/Pythagorean_triple,
; the basic way to generate Pythagorean triples is to use Euclid's formular:
; a=m^2-n^2, b=2mn, c=m^2+n^2, where m>n.
; a+b+c=1000 ==> m(m+n)=500 & m>0, n>0, m>n

(require "../factor.rkt")

(define (special-pythagorean summation)
  (letrec ((sum (/ summation 2))
           (factor-lst (reverse (factors sum))))
    (define (answer? m n) (and (> m 0) (> n 0) (> m n)))
    
    (define (find-product m n)
      (* (- (* m m) (* n n)) 2 m n (+ (* m m) (* n n))))
    
    (define (helper lst)
      (if (null? lst) #f
          (letrec ((m (car lst))
                   (n (- (/ sum (car lst)) m)))
            (if (answer? m n)
                (find-product m n)
                (helper (cdr lst))))))
    (helper factor-lst)))
    
