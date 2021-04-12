;; Exercise 1.1
; Below is a sequence of expressions.  What is the result printed by the interpreter inresponse to each expression?  Assume that the sequence is to be evaluated in the order in which itis presented. 

10
;10

(+ 5 3 4)
;12

(- 9 1)
;8

(/ 6 2)
;3

(+ (* 2 4) (- 4 6))
;6

(define a 3)
;

(define b (+ a 1))
;

(+ a b (* a b))
;19

(= a b)
;#f

(if (and (> b a) (< b (* a b)))
    b
    a)
;4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;6

(+ 2 (if (> b a) b a))
;6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;16

;; Exercise 1.3
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square_sum a b c)
  (
    cond(
      (and (>= b a) (>= c a))
      (+ (* b b) (* c c))
    )
    (
      (and (>= a b) (>= c b))
      (+ (* a a) (* c c))
    )
    (
      else (+ (* a a) ( * b b))
    )
  ))
(square_sum 3 3 5)




;; Exercise 1.6
; Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

#|
Since Lisp uses applicative-order evaluation, the interpreter evaluates all arguments before evaluating the function. However, since the function is recursive, the else-clause, which is sqrt-iter itself, will be evaluated before checking if the current guess is good enough, hence resulting in an infinite loop.
|#





;; Exercise 1.10
; The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 3 3)
; What are the values of the following expressions?: (A 1 10) (A 2 4) (A 3 3)

#|
(A 1 10):1024
(A 1 n) = (A 0 (A 1 n-1)) = 2*(A 1 n-1) --> A(1 n) = 2^n
(A 2 4): 65536
(A 2 n) = A( 1 A(2 n-1)) = 2^A(2 n-1) --> A(2 n) = 2|^ n
(A 3 3): 65536
(A 3 3) = A( 2 A(3, 2)) = A( 2 A( 2 A(3 1))) = A( 2 A( 2 2)) = A( 2 4) = 65536
|#





;; Exercise 1.11
; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process. 

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))


(define (f-iterative n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))

(f-recursive 7)





;; Exercise 1.12
; The following pattern of numbers is called Pascal's triangle.The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a procedure that computes elements of Pascal's triangle by means of a recursive process. 

(define (pascal r c)
  (
    cond( (or (= r 1) (= c 1) (= r c)) 1)
        (else (+ (pascal (- r 1) c ) 
                  (pascal (- r 1) (- c 1))))
  )
)
(pascal 10 4)








;; Exercise 1.17
; The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-mult a b)
  (cond ((= a 1) b)
        ((= a 0) 0)
        ((even? a) (* 2 (fast-mult (/ a 2) b)))
        (else (+ b (fast-mult (- a 1) b)))))

(fast-mult 7 3)



