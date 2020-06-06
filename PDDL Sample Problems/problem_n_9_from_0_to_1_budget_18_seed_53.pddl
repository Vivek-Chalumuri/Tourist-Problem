(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 - node)

(:init 

(= (travelTime n0 n1) 7)
(= (travelTime n0 n2) 7)
(= (travelTime n0 n3) 9)
(= (travelTime n0 n4) 8)
(= (travelTime n0 n5) 6)
(= (travelTime n0 n6) 0)
(= (travelTime n0 n7) 6)
(= (travelTime n0 n8) 11)
(= (travelTime n1 n0) 7)
(= (travelTime n1 n2) 4)
(= (travelTime n1 n3) 2)
(= (travelTime n1 n4) 2)
(= (travelTime n1 n5) 0)
(= (travelTime n1 n6) 7)
(= (travelTime n1 n7) 6)
(= (travelTime n1 n8) 5)
(= (travelTime n2 n0) 7)
(= (travelTime n2 n1) 4)
(= (travelTime n2 n3) 3)
(= (travelTime n2 n4) 1)
(= (travelTime n2 n5) 3)
(= (travelTime n2 n6) 8)
(= (travelTime n2 n7) 2)
(= (travelTime n2 n8) 3)
(= (travelTime n3 n0) 9)
(= (travelTime n3 n1) 2)
(= (travelTime n3 n2) 3)
(= (travelTime n3 n4) 1)
(= (travelTime n3 n5) 2)
(= (travelTime n3 n6) 9)
(= (travelTime n3 n7) 6)
(= (travelTime n3 n8) 3)
(= (travelTime n4 n0) 8)
(= (travelTime n4 n1) 2)
(= (travelTime n4 n2) 1)
(= (travelTime n4 n3) 1)
(= (travelTime n4 n5) 2)
(= (travelTime n4 n6) 8)
(= (travelTime n4 n7) 4)
(= (travelTime n4 n8) 3)
(= (travelTime n5 n0) 6)
(= (travelTime n5 n1) 0)
(= (travelTime n5 n2) 3)
(= (travelTime n5 n3) 2)
(= (travelTime n5 n4) 2)
(= (travelTime n5 n6) 6)
(= (travelTime n5 n7) 5)
(= (travelTime n5 n8) 6)
(= (travelTime n6 n0) 0)
(= (travelTime n6 n1) 7)
(= (travelTime n6 n2) 8)
(= (travelTime n6 n3) 9)
(= (travelTime n6 n4) 8)
(= (travelTime n6 n5) 6)
(= (travelTime n6 n7) 6)
(= (travelTime n6 n8) 11)
(= (travelTime n7 n0) 6)
(= (travelTime n7 n1) 6)
(= (travelTime n7 n2) 2)
(= (travelTime n7 n3) 6)
(= (travelTime n7 n4) 4)
(= (travelTime n7 n5) 5)
(= (travelTime n7 n6) 6)
(= (travelTime n7 n8) 6)
(= (travelTime n8 n0) 11)
(= (travelTime n8 n1) 5)
(= (travelTime n8 n2) 3)
(= (travelTime n8 n3) 3)
(= (travelTime n8 n4) 3)
(= (travelTime n8 n5) 6)
(= (travelTime n8 n6) 11)
(= (travelTime n8 n7) 6)

(= (timeAt n0) 1)
(= (timeAt n1) 4)
(= (timeAt n2) 1)
(= (timeAt n3) 2)
(= (timeAt n4) 2)
(= (timeAt n5) 1)
(= (timeAt n6) 4)
(= (timeAt n7) 4)
(= (timeAt n8) 1)

(= (exp n0) 8)
(= (exp n1) 5)
(= (exp n2) 4)
(= (exp n3) 10)
(= (exp n4) 5)
(= (exp n5) 6)
(= (exp n6) 1)
(= (exp n7) 4)
(= (exp n8) 8)

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

(= (maxTime) 18)
(= (timeCost) 0)
(= (fun) 0)

)

(:goal (at n1))
(:metric maximize (fun))

)