#lang racket

;; Problem 1
;; =============================================================================
;; Makes cubed function to call for sphere-volume
(define (cubed x)
  (* x x x))

(define (sphere-volume r)
  (* 4 3.14 (/(cubed r)3)))

(define (shell-volume x y)
  (-(sphere-volume x)(sphere-volume y)))

;; Test Cases
;; > (shell-volume 10 3)
;; 4073.626666666667
;; > (shell-volume  7 5)
;; 912.6933333333333

;; Problem 2
;; =============================================================================

(define (close? n1 n2 limit)
  (< (abs (- n1 n2)) limit))

;; Test Cases
;; > (close? 1 5 7)
;; #t
;; > (close? 6 9 2) 
;; #f

;; Problem 3
;; =============================================================================
(define (how-many a b c)
  (cond
   [(> (quadratic a b c) 0) 2]
   [(= (quadratic a b c) 0) 1]
   [(< (quadratic a b c) 0) 0]))

(define (quadratic cha b c)
  (- (* b b) (* 4 a c)))

;; Test Cases
;; > (how-many 1 0 -1)
;; 2
;; > (how-many 2 4 2)
;; 1

;; Problem 4
;; =============================================================================
(define (filter-out-symbol list symbol)
 (cond ((null? list) '())
 ((eq? symbol (car list))
 (filter-out-symbol (cdr list) symbol))
 (else (cons (car list)
 (filter-out-symbol (cdr list) symbol)))))

;; Test Cases
;; > (filter-out-symbol '(no no a thousand times no) 'no)
;; (a thousand times)
;; > (filter-out-symbol '(yes no a thousand times yes)'yes)
;; (no a thousand times)


;; Problem 5
;; =============================================================================
(define (minList L)
  (cond ((null? (cdr L)) (car L))
    ((< (car L) (minList (cdr L))) (car L))
    (else (minList (cdr L)))))

(define (maxList L)
  (cond ((null? (cdr L)) (car L))
    ((> (car L) (maxList (cdr L))) (car L))
    (else (maxList (cdr L)))))

(define (pMinMax L)
  (list (minList L) (maxList L)))

;; Test Cases
;; (pMinMax '(4 5 6))
;; '(4 6)
;; (pMinMax '(20 7 -18))
;; '(-18 20)

;; Problem 6
;; =============================================================================
(define (inc_n n)
  (λ (x) (+ n x)))

;; Test Cases
;; ((inc_n 5) 2)
;; 7
;; ((inc_n -5) 8)
;; 3
