#lang racket
(provide gen-prime)
(provide prime?)
(provide coprime)

(define (looping base lst)
  (define (helper count new_lst)
    (let ((index (* base count)))
      (if (> index (length new_lst)) new_lst
          (helper (+ count 1)
                  (append (append (take new_lst index) '(0)) (drop new_lst (+ index 1)))))))
  (helper 1 lst))

;; generate all prime numbers smaller than n
;; n should be positive and larger than one
(define (gen-prime n)
  (define (helper target ref)
    (cond ((null? ref) target)
          ((= 0 (list-ref target (- (car ref) 2))) (helper target (cdr ref)))
          (#t (helper (map (lambda (index) 
                             (if (and (not (= index (car ref))) (= 0 (modulo index (car ref)))) 0 index)) target) 
                      (cdr ref)))))
  (let ((candidates (range 2 n))
        (prime-range (range 2 (+ 1 (integer-sqrt n)))))
    (filter (lambda (x) (not (= 0 x)))
            (helper candidates prime-range))))

;; determine if a number is prime
;; n should be positive and larger than one
(define (prime? n)
  (let ((root (integer-sqrt n)))
    (define (helper i)
      (cond ((> i root) #t)
            ((= 0 (modulo n i)) #f)
            (#t (helper (+ i 1)))))
    (and (> n 1) (helper 2))))

;; find all numbers coprime and smaller than n
;; a similar way as gen-prime with a given upper bound
(define (coprime n)
  (letrec ((candidates (range 1 n))
           (srange (range 2 (+ 1 (quotient n 2)))))
    (define (helper result refs)
      (cond ((null? refs) result)
            ((or (not (= 0 (remainder n (car refs))))
                 (not (member (car refs) result)))
             (helper result (cdr refs)))
            (#t (helper (filter (lambda (x) (not (= 0 (remainder x (car refs))))) result)
                        (cdr refs)))))
    (helper candidates srange)))