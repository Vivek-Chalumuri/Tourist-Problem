(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 - node)

(:init 

(= (travelTime n0 n1) 7)
(= (travelTime n0 n2) 9)
(= (travelTime n0 n3) 5)
(= (travelTime n0 n4) 3)
(= (travelTime n0 n5) 8)
(= (travelTime n1 n0) 7)
(= (travelTime n1 n2) 2)
(= (travelTime n1 n3) 5)
(= (travelTime n1 n4) 7)
(= (travelTime n1 n5) 2)
(= (travelTime n2 n0) 9)
(= (travelTime n2 n1) 2)
(= (travelTime n2 n3) 6)
(= (travelTime n2 n4) 9)
(= (travelTime n2 n5) 3)
(= (travelTime n3 n0) 5)
(= (travelTime n3 n1) 5)
(= (travelTime n3 n2) 6)
(= (travelTime n3 n4) 8)
(= (travelTime n3 n5) 7)
(= (travelTime n4 n0) 3)
(= (travelTime n4 n1) 7)
(= (travelTime n4 n2) 9)
(= (travelTime n4 n3) 8)
(= (travelTime n4 n5) 6)
(= (travelTime n5 n0) 8)
(= (travelTime n5 n1) 2)
(= (travelTime n5 n2) 3)
(= (travelTime n5 n3) 7)
(= (travelTime n5 n4) 6)

(= (timeAt n0) 2)
(= (timeAt n1) 5)
(= (timeAt n2) 1)
(= (timeAt n3) 5)
(= (timeAt n4) 4)
(= (timeAt n5) 5)

(= (exp n0) 6)
(= (exp n1) 9)
(= (exp n2) 9)
(= (exp n3) 3)
(= (exp n4) 5)
(= (exp n5) 4)

(haveVisited n0)
(at n0)
(notVisited n1)
(notVisited n2)
(notVisited n3)
(notVisited n4)
(notVisited n5)

(= (maxTime) 12)
(= (timeCost) 0)
(= (fun) 0)

)

(:goal (at n1))
(:metric maximize (fun))

)