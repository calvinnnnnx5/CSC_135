#lang racket

;; Problem A "veryLucky"
;; =============================================================================
  ;Int is "veryLucky" if every one of its digits is 6 or 8, function returns (#t)true
  ;or (#f)false. Must work for +/- #'s. Can use modulo and integer division function. 
  ;Assume int is being passed in. 

;veryLucky -> boolean
;given digit see if it contains only 6 and 8
(define (veryLucky num)
    (checkParce (string->list (number->string num))))

;take the parcer of sume-of-digits program
;ASCI-Value minus 48
(define (parseDigit c)
    (- (char->integer c) 48))

(define (checkMod M)
  (or (equal? (modulo M 6)0) (equal? (modulo M 8)0)))
  
 
;sums a list of characters as integers
;(addDigitString (list #\1 #\2))
(define (checkParce charList)
    (cond 
        [(= 1 (length charList)) (checkMod(parseDigit (first charList)))]
        [else ( checkMod (parseDigit (first charList))) (checkParce (rest charList))]
    )
)

;; Problem B "firstMidLast"
;; =============================================================================
  ;Accept list and return list of 3 elements (first, mid and last elements of original list).
  ;Assume incoming list is 3<= elements and is odd length. 
  ;(firstMidLast '(10 11 12 13 14 15 16) returns (10 13 16)

;firstMidLast -> list
;given list output list with first mid and last values

(define (firstMidLast l)
  (list (car l) (getNth (quotient(howMany l) 2) l) (lastElement l)))

;returns last element of list
(define (lastElement l)
  (cond ((null? (cdr l)) (car l))
        (else (lastElement (cdr l)))))

(define (index xs y)
  (for/first ([(x i) (in-indexed xs)]
              #:when (equal? x y))
    i))

(define getNth                     
   (lambda (n list)                   
      (cond ((null? list) '())             
            ((= n 0) (car list))              
            (else (getNth (- n 1) (cdr list))))))

(define (howMany list)
  (if (null? list)
      0
      (+ 1 (howMany (cdr list)))))

;; Problem C "shuffleListHalves"
;; =============================================================================
  ;Accept list, break it in half and build new list that alternates the elements
  ;of the 2 list halves. Split list in half then merges together. Should work on
  ;odd lenght lists. (1 2 3 4 5 6) becomes (1 4 2 5 3 6) and (1 2 3) becomes (1 3 2)

(define (listLength list)
(if (null? list)
    0
    (+ 1 (listLength (cdr list)))))

(define (firstXOfList list x)
(if (<= x 0)
  empty
  (cons (car list) (firstXOfList (cdr list) (- x 1)))))

(define (lastXOfList list x)
(reverse (firstXOfList (reverse list) x)))

(define (shuffleTwoLists list1 list2)
(if (null? list1)
  list2
  (if (null? list2)
    list1
    (cons (car list1) (cons (car list2) (shuffleTwoLists (cdr list1) (cdr list2)))))))

(define (shuffleListHalves list)
(shuffleTwoLists
(firstXOfList list (ceiling (/ (listLength list) 2)))
(lastXOfList list (floor (/ (listLength list) 2)))))

;; Problem D "firstFunctionSmaller"
;; =============================================================================
  ;take 2 functions F and G and list L. Returns a list with those elements from L where F(L)
  ;< G(L).

;; Problem E "getNestedBiggest"
;; =============================================================================

;getNestedBiggest -> number

(define (getNestedBiggest l)
  (cond ((pair? l) (max (getNestedBiggest (car l)) (getNestedBiggest (cdr l))))
        ((number? l) l)
        (else 0)))

;; Problem F "makePicker"
;; =============================================================================
(define (makeExploder x y) 
  (define (h L)
    (if (null? L) '() 
        (cons (* y (+ x (car L))) (h (cdr L)))
    )
   )
 h)







