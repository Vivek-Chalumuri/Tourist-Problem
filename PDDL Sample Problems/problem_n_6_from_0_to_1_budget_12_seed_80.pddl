(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 - node)

(:init 

(= (travelTime n0 n1) 2)
(= (travelTime n0 n2) 4)
(= (travelTime n0 n3) 5)
(= (travelTime n0 n4) 7)
(= (travelTime n0 n5) 5)
(= (travelTime n1 n0) 2)
(= (travelTime n1 n2) 5)
(= (travelTime n1 n3) 5)
(= (travelTime n1 n4) 7)
(= (travelTime n1 n5) 3)
(= (travelTime n2 n0) 4)
(= (travelTime n2 n1) 5)
(= (travelTime n2 n3) 0)
(= (travelTime n2 n4) 4)
(= (travelTime n2 n5) 7)
(= (travelTime n3 n0) 5)
(= (travelTime n3 n1) 5)
(= (travelTime n3 n2) 0)
(= (travelTime n3 n4) 3)
(= (travelTime n3 n5) 7)
(= (travelTime n4 n0) 7)
(= (travelTime n4 n1) 7)
(= (travelTime n4 n2) 4)
(= (travelTime n4 n3) 3)
(= (travelTime n4 n5) 7)
(= (travelTime n5 n0) 5)
(= (travelTime n5 n1) 3)
(= (travelTime n5 n2) 7)
(= (travelTime n5 n3) 7)
(= (travelTime n5 n4) 7)

(= (timeAt n0) 1)
(= (timeAt n1) 2)
(= (timeAt n2) 4)
(= (timeAt n3) 4)
(= (timeAt n4) 3)
(= (timeAt n5) 3)

(= (exp n0) 9)
(= (exp n1) 3)
(= (exp n2) 2)
(= (exp n3) 3)
(= (exp n4) 8)
(= (exp n5) 2)

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