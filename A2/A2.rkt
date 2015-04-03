;Irving Rodriguez
;Homework 2 
;section 1
;------------------------Problem A-------------------------------------------------
(define (fraktorial x) 
  (if (< x 1) 1 ;(if (condition) true false) 
      (if (= (remainder x 2) 0) (* x (fraktorial(- x 2))) (fraktorial(- x 1)))))




;---------------------------Problem B--------------------------------------
;

(define (evenList L) (if (=(remainder (Length L) 2)0) #t #f)) 


(define( apnd a L) (if (null? L) (cons a '()) (cons (car L) (apnd a (cdr L)))))


(define (Length L) (if (null? L) 0 (+ (Length (cdr L)) 1)))


(define (reverse1 L) (if (null? L ) '() (apnd (car L) (reverse1 (cdr L)))));need this


(define (reversefrontUntilNum n L)(define (loop n i o)(if (> n 0)(loop (- n 1) (cdr i) (cons (car i) o))o))(loop L n '()))


(define (backnumbers x list)(let ((head (car list))(tail (cdr list)))(if (= x head) tail(backnumbers x tail))))

(define (middleList L) (floor( / (Length L) 2)))

(define (revhalfront L) (reversefrontUntilNum L( middleList L)))
(define (revhalfback L) (if (evenList L) (reverse1 (backnumbers (middleList L) L)) (reverse1 (cdr (backnumbers (middleList L) L)))))
(define (revmidNum L) (list(car (backnumbers (middleList L) L))) )

(define (reverseListHalves L)  (if (null? L) L(if(evenList L )(append(append (revhalfront L) (revhalfback L))) (append(append (revhalfront L) (revmidNum L))(revhalfback L))))) 
;------------------------------------Problem C---------------------------------------------------------
(define (ismember x L) (cond((null? L) #f)((= x (car L)) #t) (#t(ismember x (cdr L)))))

(define (dualLength L M) (if(null? M) 0 (if (null? L) "cant compute" (+ (Length (cdr L)) 1))))
(define (removeNum x L) (if (= (car L) x) x (removeNum x (cdr L)))) 
(define (removeNth L n)(if (null? L)0(if (= 0 n) (car L) (removeNth(cdr L) (- n 1)))))
(define (myMap f L) (if (null? L) '() (cons(f(car L)) (myMap f (cdr L)))))


(define (sumPicker M N) (if (null? N) 0 (if (null? M)  0 (+ (removeNth N (car M)) (sumPicker (cdr M ) N)))))


;----------------------------------------Problem D---------------------------------------------------------


(define (checkifStillList L)(if (list? (car L)) #t #f))

(define (countEvens L)(if (null? L) 0 (if (checkifStillList L) (+ (countEvens (car L))(countEvens (cdr L))) (if (= (remainder (car L) 2) 0)(+ 1 (countEvens (cdr L)))(countEvens (cdr L))))))


;----------------------------------------Problem E---------------------------------------------------------

(define (double  x) (* 2 x))
(define (triple x )(* 3 x))

(define (applyUntilTooBig F N) (if (< N 100) (applyUntilTooBig F (F N)) N))


;------------------------------------Problem F--------------------------------------------------------

(define (makeExploder x y) (define (h L)(if (null? L) '() (cons (* y (+ x (car L))) (h (cdr L)))))h)