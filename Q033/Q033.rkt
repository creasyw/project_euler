#lang racket

;; assume both a and b only have two digits
;; since the function "member" returns list starting from common digit
;; (car (common-digit a b)) will access the common digit given they have one.
(define (common-digit a b)
  (let ((fsta (remainder a 10))
        (snda (quotient a 10))
        (fstb (quotient b 10))
        (sndb (remainder b 10)))
    (cond ((= fsta fstb) (list snda sndb fsta))
          ((= fsta sndb) (list snda fstb fsta))
          ((= snda fstb) (list fsta sndb snda))
          ((= snda sndb) (list fsta fstb snda))
          (#t (list a b)))))

(define (cancelling-frac)
  ;; assuming the fraction is "a/b"
  (define (looper a b acc)
    (cond ((= b 100) acc)
          ((= b a) (looper 10 (+ b 1) acc))
          (#t (let ((temp (common-digit a b)))
                (if (and (= 3 (length temp))           ;; existence
                         (not (= 0 (cadr temp)))       ;; denominator not zero
                         (not (= 0 (caddr temp)))      ;; non-trivial
                         (= (/ a b) (/ (car temp) (cadr temp))))
                     (looper (+ a 1) b (* acc (/ a b)))
                    (looper (+ a 1) b acc))))))
  (denominator (looper 10 11 1)))

(cancelling-frac)