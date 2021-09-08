;; Collatz Conjecture
;; Supposedly given any number X if you follow this sequence it will eventually end in a repeating 4 2 1 pattern.
;; In the sequence if x is even the next number will be x/2. If it is odd, the next number will be 3x+1. 
;; It is assumed but not proven, that it will always, given any number, result in a repeating 4,2,1 pattern.


(defun isEven 
    (x) 
    (= 
        (mod x 2) 0) )

(defun evenCalc 
    (x) 
    (/ x 2))

(defun oddCalc 
    (x) 
    (+ 1 
        (* 3 x)))

(defun recursiveCollatz 
    (myList) 
    (let* 
        (
            (myNum 
                (car myList)) 
            (nextNum 
                (if 
                    (isEven myNum) 
                    (evenCalc myNum) 
                    (oddCalc myNum) ))
            (nextList 
                (cons nextNum myList))) 
        (if 
            (= nextNum 1) 
            (reverse nextList) 
            (recursiveCollatz nextList) ) ))

(defun collatz 
    (x) 
    (recursiveCollatz 
        (list x)))

(print 
    (collatz 8675309))