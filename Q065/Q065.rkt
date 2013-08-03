#lang racket

;; import num->intlst
(require "../list.rkt")

;; imported from q064 with minor modification
;; but... it gives wrong answer for this question
;; there will be more and more deviation with increasing terms.
(define (find-looper n nround)
  (letrec ((sq (sqrt n)))
    (define (helper p q count acc)
      (if (= count (- nround 1)) acc
          (letrec ((temp (floor (/ (* q (+ sq p)) (- n (* p p)))))
                   (qp (/ (- n (* p p)) q))
                   (pp (- (* qp temp) p)))
            (helper pp qp (+ count 1) (cons temp acc)))))
    (helper (floor (sqrt n)) 1.0 0 (list (floor (sqrt n))))))

(define (e-loop nround)
  (if (< nround 3) (list 2 1)
      (append (list 2 1)
              (for/list ((i (in-range 3 (+ nround 1))))
                (if (= 0 (modulo i 3)) (* 2 (/ i 3)) 1)))))

(define (convergent lst)
  (define (helper numerator denominator rest)
    (if (null? rest) (cons denominator numerator)
        (helper denominator 
                (+ numerator (* (car rest) denominator))
                (cdr rest))))
  (helper 1 (car lst) (cdr lst)))

(define (q065 nround)
  (foldl + 0 (num->intlst (car (convergent (reverse (e-loop nround)))))))

(q065 100)