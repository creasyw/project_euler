#lang racket
(require htdp/matrix)

(define (lattice-path side)
  (let ((y (make-matrix side side (range (* side side)))))
    ;; in operate-row the number is the index in the matrix
    (define (operate-row mt ri)
      (define (local mt ci)
        (cond ((= ci side) mt)
              ((and (= ri 0) (< ci side)) (local (matrix-set mt ri ci 1) (+ ci 1)))
              ((= ci 0) (local (matrix-set mt ri ci 1) (+ ci 1)))
              (#t (local (matrix-set mt ri ci (+ (matrix-ref mt (- ri 1) ci) (matrix-ref mt ri (- ci 1)))) (+ ci 1)))))
      (local mt 0))
    ;; in helper the nrow is the count of rows
    (define (helper mt nrow)
      (if (> nrow side) (matrix-ref mt (- side 1) (- side 1))
          (helper (operate-row mt (- nrow 1)) (+ nrow 1))))
    (helper y 1)))

(lattice-path 21)