(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - node)

(:init 

(= (travelTime n0 n1) 5)
(= (travelTime n0 n2) 6)
(= (travelTime n0 n3) 7)
(= (travelTime n0 n4) 7)
(= (travelTime n0 n5) 5)
(= (travelTime n0 n6) 7)
(= (travelTime n0 n7) 7)
(= (travelTime n0 n8) 3)
(= (travelTime n0 n9) 4)
(= (travelTime n0 n10) 0)
(= (travelTime n0 n11) 4)
(= (travelTime n1 n0) 5)
(= (travelTime n1 n2) 10)
(= (travelTime n1 n3) 7)
(= (travelTime n1 n4) 11)
(= (travelTime n1 n5) 4)
(= (travelTime n1 n6) 6)
(= (travelTime n1 n7) 10)
(= (travelTime n1 n8) 8)
(= (travelTime n1 n9) 4)
(= (travelTime n1 n10) 5)
(= (travelTime n1 n11) 1)
(= (travelTime n2 n0) 6)
(= (travelTime n2 n1) 10)
(= (travelTime n2 n3) 4)
(= (travelTime n2 n4) 1)
(= (travelTime n2 n5) 6)
(= (travelTime n2 n6) 6)
(= (travelTime n2 n7) 1)
(= (travelTime n2 n8) 3)
(= (travelTime n2 n9) 6)
(= (travelTime n2 n10) 6)
(= (travelTime n2 n11) 9)
(= (travelTime n3 n0) 7)
(= (travelTime n3 n1) 7)
(= (travelTime n3 n2) 4)
(= (travelTime n3 n4) 6)
(= (travelTime n3 n5) 3)
(= (travelTime n3 n6) 1)
(= (travelTime n3 n7) 4)
(= (travelTime n3 n8) 6)
(= (travelTime n3 n9) 4)
(= (travelTime n3 n10) 6)
(= (travelTime n3 n11) 7)
(= (travelTime n4 n0) 7)
(= (travelTime n4 n1) 11)
(= (travelTime n4 n2) 1)
(= (travelTime n4 n3) 6)
(= (travelTime n4 n5) 8)
(= (travelTime n4 n6) 7)
(= (travelTime n4 n7) 2)
(= (travelTime n4 n8) 4)
(= (travelTime n4 n9) 7)
(= (travelTime n4 n10) 7)
(= (travelTime n4 n11) 11)
(= (travelTime n5 n0) 5)
(= (travelTime n5 n1) 4)
(= (travelTime n5 n2) 6)
(= (travelTime n5 n3) 3)
(= (travelTime n5 n4) 8)
(= (travelTime n5 n6) 2)
(= (travelTime n5 n7) 6)
(= (travelTime n5 n8) 5)
(= (travelTime n5 n9) 1)
(= (travelTime n5 n10) 4)
(= (travelTime n5 n11) 4)
(= (travelTime n6 n0) 7)
(= (travelTime n6 n1) 6)
(= (travelTime n6 n2) 6)
(= (travelTime n6 n3) 1)
(= (travelTime n6 n4) 7)
(= (travelTime n6 n5) 2)
(= (travelTime n6 n7) 5)
(= (travelTime n6 n8) 6)
(= (travelTime n6 n9) 3)
(= (travelTime n6 n10) 6)
(= (travelTime n6 n11) 6)
(= (travelTime n7 n0) 7)
(= (travelTime n7 n1) 10)
(= (travelTime n7 n2) 1)
(= (travelTime n7 n3) 4)
(= (travelTime n7 n4) 2)
(= (travelTime n7 n5) 6)
(= (travelTime n7 n6) 5)
(= (travelTime n7 n8) 4)
(= (travelTime n7 n9) 6)
(= (travelTime n7 n10) 6)
(= (travelTime n7 n11) 9)
(= (travelTime n8 n0) 3)
(= (travelTime n8 n1) 8)
(= (travelTime n8 n2) 3)
(= (travelTime n8 n3) 6)
(= (travelTime n8 n4) 4)
(= (travelTime n8 n5) 5)
(= (travelTime n8 n6) 6)
(= (travelTime n8 n7) 4)
(= (travelTime n8 n9) 5)
(= (travelTime n8 n10) 3)
(= (travelTime n8 n11) 7)
(= (travelTime n9 n0) 4)
(= (travelTime n9 n1) 4)
(= (travelTime n9 n2) 6)
(= (travelTime n9 n3) 4)
(= (travelTime n9 n4) 7)
(= (travelTime n9 n5) 1)
(= (travelTime n9 n6) 3)
(= (travelTime n9 n7) 6)
(= (travelTime n9 n8) 5)
(= (travelTime n9 n10) 3)
(= (travelTime n9 n11) 3)
(= (travelTime n10 n0) 0)
(= (travelTime n10 n1) 5)
(= (travelTime n10 n2) 6)
(= (travelTime n10 n3) 6)
(= (travelTime n10 n4) 7)
(= (travelTime n10 n5) 4)
(= (travelTime n10 n6) 6)
(= (travelTime n10 n7) 6)
(= (travelTime n10 n8) 3)
(= (travelTime n10 n9) 3)
(= (travelTime n10 n11) 4)
(= (travelTime n11 n0) 4)
(= (travelTime n11 n1) 1)
(= (travelTime n11 n2) 9)
(= (travelTime n11 n3) 7)
(= (travelTime n11 n4) 11)
(= (travelTime n11 n5) 4)
(= (travelTime n11 n6) 6)
(= (travelTime n11 n7) 9)
(= (travelTime n11 n8) 7)
(= (travelTime n11 n9) 3)
(= (travelTime n11 n10) 4)

(= (timeAt n0) 3)
(= (timeAt n1) 5)
(= (timeAt n2) 5)
(= (timeAt n3) 2)
(= (timeAt n4) 3)
(= (timeAt n5) 3)
(= (timeAt n6) 3)
(= (timeAt n7) 4)
(= (timeAt n8) 5)
(= (timeAt n9) 4)
(= (timeAt n10) 5)
(= (timeAt n11) 1)

(= (exp n0) 10)
(= (exp n1) 10)
(= (exp n2) 8)
(= (exp n3) 9)
(= (exp n4) 9)
(= (exp n5) 7)
(= (exp n6) 6)
(= (exp n7) 3)
(= (exp n8) 1)
(= (exp n9) 1)
(= (exp n10) 10)
(= (exp n11) 3)

(haveVisited n0)
(at n0)
(notVisited n1)
(notVisited n2)
(notVisited n3)
(notVisited n4)
(notVisited n5)
(notVisited n6)
(notVisited n7)
(notVisited n8)
(notVisited n9)
(notVisited n10)
(notVisited n11)

(= (maxTime) 24)
(= (timeCost) 0)
(= (fun) 0)

)

(:goal (at n1))
(:metric maximize (fun))

)