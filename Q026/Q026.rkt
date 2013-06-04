#lang racket
;; import list-max
(require "../list.rkt")

;; find the # of common digits between a and b
;; assuming a is bigger than b
(define (common a b)
  (define (helper acc)
    (let ((ap (quotient a (expt 10 acc)))
          (bp (quotient b (expt 10 acc))))
      (cond ((or (= ap 0 ) (= bp 0)) acc)
            ((not (= 0 (remainder (- ap bp) 10))) acc)
            (#t (helper (+ acc 1))))))
  (helper 0))

;; this function could do the dirty work but could not always return the right answer.
(define (recurring-cycle n)
  (define (finding acc)
    (let ((zeros (common (quotient (expt 10 (* acc 2)) n)
                         (quotient (expt 10 acc) n))))
      (if (= zeros 0)
          (finding (+ acc 1)) acc)))
  (letrec ((first (finding 1))
           (second (finding (+ first 1)))
           (third (finding (+ second 1))))
    ;; if the two differences are not equal, there is no recurring.
    (if (= (- second first) (- third second)) (- second first) 0)))

;; the right solution comes from the property of recurring cycle division
;; of wikipedia: The period of 1/k for integer k is always <= k − 1.
(define (recur-cycle n acc)
  (cond ((= acc n) 0)
        ((= 1 (remainder (expt 10 acc) n)) acc)
        (#t (recur-cycle n (+ acc 1)))))

(define (main limit)
  (define (helper maxvalue result acc)
    (if (= acc limit) result
        (let ((temp (recur-cycle acc 1)))
          (if (> temp maxvalue)
              (helper temp acc (+ acc 1))
              (helper maxvalue result (+ acc 1))))))
  (helper 1 3 4))
