#lang racket
(require "../hash.rkt")

(define one (make-hash))
(hash-set-stream one (cons 1 "one") (cons 2 "two") (cons 3 "three")
                 (cons 4 "four") (cons 5 "five") (cons 6 "six") (cons 7 "seven")
                 (cons 8 "eight") (cons 9 "nine") (cons 10 "ten")
                 (cons 11 "eleven") (cons 12 "twelve") (cons 13 "thirteen")
                 (cons 14 "fourteen") (cons 15 "fifteen") (cons 16 "sixteen")
                 (cons 17 "seventeen") (cons 18 "eighteen") (cons 19 "nineteen"))

(define ten (make-hash))
(hash-set-stream ten (cons 2 "twenty") (cons 3 "thirty") (cons 4 "forty")
                 (cons 5 "fifty") (cons 6 "sixty") (cons 7 "seventy")
                 (cons 8 "eighty") (cons 9 "ninety"))

;; because the question only counts the number of characters,
;; this function generates the english numbers without spaces,
;; which makes the couting for the length of the list is easier.
(define (to-english num)
  (cond ((and (<= num 0) (>= num 9999)) "")
        ((>= num 1000) (string-append (hash-ref one (quotient num 1000)) "thousand"
                                      (if (= 0 (remainder num 1000)) ""
                                          (to-english (remainder num 1000)))))
        ((>= num 100) (string-append (hash-ref one (quotient num 100)) "hundred"
                                     (if (= 0 (remainder num 100)) ""
                                         (string-append "and" (to-english (remainder num 100))))))
        ((>= num 20) (string-append (hash-ref ten (quotient num 10))
                                    (if (= 0 (remainder num 10)) ""
                                        (to-english (remainder num 10)))))
        (#t (hash-ref one num))))

(define (number-letter-counts lower upper)
  (define (helper current acc)
    (if (> current upper) acc
        (helper (+ current 1) (+ acc (length (string->list (to-english current)))))))
  (helper lower 0))

(number-letter-counts 1 1000)