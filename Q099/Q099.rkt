#lang racket
(provide (all-defined-out))

;; One way to open and reveal the file
;(require racket/runtime-path)
;(define-runtime-path data-file "base_exp.txt")
;
;(define (read-data)
;  (with-input-from-file data-file
;    (lambda ()
;      (read-bytes (file-size data-file)))))

;; The prototype of the "Input and Process" from file stream
;(define (read-next-line-iter file)
;	   (let ((line (read-line file)))
;	     (unless (eof-object? line)
;	       (display line)
;               (list? line)
;	       (newline)
;	       (read-next-line-iter file))))
;(call-with-input-file "test.txt" read-next-line-iter)


(define (read-next-line-iter file)
  (define (helper in-port linenum result acc)
    (let ((line (read-line in-port)))
      (if (eof-object? line) result
          (letrec ([base (string->number (car (string-split line #px",")))]
                   [expo (string->number (cadr (string-split line #px",")))]
                   [temp (* expo (log base))])
            (if (> temp acc)
                (helper in-port (+ linenum 1) linenum temp)
                (helper in-port (+ linenum 1) result acc))))))
  (helper file 1 0 0))
(call-with-input-file "base_exp.txt" read-next-line-iter)