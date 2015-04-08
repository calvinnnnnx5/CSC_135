#lang racket

;==============================;
;; Konstantin Polyashenko
;; CSC 135 - A2 Problem Set 1
;==============================;

;; Problem A "veryLucky"
;; =============================================================================
;veryLucky -> boolean
;given digit see if it contains only 6 and 8

(define (veryLucky x)
  (if (= x 1)
    #f
    (if (<= x 1)
      #t
      (if (and (not(= (modulo x 10) 6))(not(= (modulo x 10) 8)))
        #f
        (veryLucky(floor (/ x 10)))))))

;;tested with
;(veryLucky 866) -> #t

;; Problem B "firstMidLast"
;; =============================================================================
;firstMidLast -> list
;given list output list with first mid and last values

(define (firstMidLast l)
  (list (car l) (getVal (quotient(listSize l) 2) l) (lastListVal l)))

(define (listSize list)
  (if (null? list)
    0
    (+ 1 (listSize (cdr list)))))

(define (lastListVal l)
  (cond
    ((null? (cdr l)) (car l))
    (else (lastListVal (cdr l)))))

(define getVal
  (lambda (n list)
    (cond
      ((null? list) '())
      ((= n 0) (car list))
      (else (getVal (- n 1) (cdr list))))))

;;tested with
;(firstMidLast '(10 11 12 13 14 15 16)) -> '(10 13 16)

;; Problem C "shuffleListHalves"
;; =============================================================================
;shuffleListHalves -> list
;given list break in half, alternate list elements and return as a list

(define (listLength list)
  (if (null? list)
    0
    (+ 1 (listLength (cdr list)))))

(define (starttodefinedlistElements l x)
  (if (<= x 0)
    empty
    (cons (car l) (starttodefinedlistElements (cdr l) (- x 1)))))

(define (definedtolastlistElements list x)
  (reverse (starttodefinedlistElements (reverse list) x)))

(define (listShuffle F G)
  (if (null? F)
    G
    (if (null? G)
      F
      (cons (car F) (cons (car G) (listShuffle (cdr F) (cdr G)))))))

(define (shuffleListHalves list)
  (listShuffle
  (starttodefinedlistElements list (ceiling (/ (listLength list) 2)))
  (definedtolastlistElements list (floor (/ (listLength list) 2)))))

;;tested with
;(shuffleListHalves '(1 2 3 4 55 66 77 88)) -> '(1 55 2 66 3 77 4 88)
;(shuffleListHalves '(1 2 3 4 55 66 77 88 99)) -> '(1 66 2 77 3 88 4 99 55)

;; Problem D "firstFunctionSmaller"
;; =============================================================================
;firstFunctionSmaller -> list
;given list L and functions F and G, returns list of elements from L where F(L)<G(L)

(define (firstFunctionSmaller F G l)
  (if (null? l)
    empty
    (if
      (< (F (car l)) (G (car l)))
      (cons (car l) (firstFunctionSmaller F G (cdr l)))
      (firstFunctionSmaller F G (cdr l)))))

(define (double x) (* x 2)) ;function double x*2
(define (square x) (* x x)) ;function squared x*x

;;tested with
;(firstFunctionSmaller double square '(1 2 -3 7)) -> '(-3 7)

;; Problem E "getNestedBiggest"
;; =============================================================================
;getNestedBiggest -> integer
;given int list return the largest element, must work for nested lists

(define (getNestedBiggest l)
  (cond
    ((pair? l) (max (getNestedBiggest (car l)) (getNestedBiggest (cdr l))))
    ((number? l) l)
    (else 0)))

;;tested with
;(getNestedBiggest '(2 3 (4 (7 6) 5))) -> 7

;; Problem F "makePicker"
;; =============================================================================
;makePicker -> integer
;given integer it builds and returns "pi

(define (makePicker N)
  (lambda (L)
  (getValue N L)))

(define getValue
  (lambda (n list)
    (cond
      ((null? list) '())
      ((= n 1) (car list))
      (else (getValue (- n 1) (cdr list))))))

;;tested with
;(define P (makePicker 5)) -> (P '(4 8 2 9 -1 13)) -> -1
;(define P (makePicker 5)) -> (P '(-2 3 -4 8 9 1 7)) -> 9
