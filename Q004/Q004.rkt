#lang racket

(define (check-palindrome num)
  (define (find-base n base)
    (if (= 0 (quotient n base))
        (find-base n (/ base 10))
        (is-pal n base)))
  (define (is-pal n base)
    (cond (( = base 1) #t)
          ((= base 10) (if (= (quotient n base) (modulo n base)) #t #f))
          (#t (if (= (quotient n base) (modulo n 10))
                  (is-pal (quotient (modulo n base) 10) (quotient base 100)) #f))))
  (find-base num 100000))


(define (largest-pal limit base)
  (define (helper n1 n2 acc)
    (letrec ((product (* n1 n2)))
      (cond ((< n1 base) acc)
            ((< product acc) (helper (- n1 1) limit acc))
            ((check-palindrome product) (helper n1 (- n2 1) product))
            ((> n2 n1) (helper n1 (- n2 1) acc))
            (#t (helper (- n1 1) limit acc)))))
  (helper limit limit 0))