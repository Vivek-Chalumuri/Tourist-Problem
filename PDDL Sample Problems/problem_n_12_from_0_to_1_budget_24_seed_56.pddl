(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - node)

(:init 

(= (travelTime n0 n1) 8)
(= (travelTime n0 n2) 8)
(= (travelTime n0 n3) 2)
(= (travelTime n0 n4) 9)
(= (travelTime n0 n5) 7)
(= (travelTime n0 n6) 0)
(= (travelTime n0 n7) 1)
(= (travelTime n0 n8) 9)
(= (travelTime n0 n9) 11)
(= (travelTime n0 n10) 9)
(= (travelTime n0 n11) 8)
(= (travelTime n1 n0) 8)
(= (travelTime n1 n2) 1)
(= (travelTime n1 n3) 9)
(= (travelTime n1 n4) 8)
(= (travelTime n1 n5) 5)
(= (travelTime n1 n6) 8)
(= (travelTime n1 n7) 8)
(= (travelTime n1 n8) 1)
(= (travelTime n1 n9) 3)
(= (travelTime n1 n10) 1)
(= (travelTime n1 n11) 8)
(= (travelTime n2 n0) 8)
(= (travelTime n2 n1) 1)
(= (travelTime n2 n3) 10)
(= (travelTime n2 n4) 10)
(= (travelTime n2 n5) 6)
(= (travelTime n2 n6) 8)
(= (travelTime n2 n7) 9)
(= (travelTime n2 n8) 3)
(= (travelTime n2 n9) 5)
(= (travelTime n2 n10) 3)
(= (travelTime n2 n11) 9)
(= (travelTime n3 n0) 2)
(= (travelTime n3 n1) 9)
(= (travelTime n3 n2) 10)
(= (travelTime n3 n4) 8)
(= (travelTime n3 n5) 7)
(= (travelTime n3 n6) 2)
(= (travelTime n3 n7) 1)
(= (travelTime n3 n8) 10)
(= (travelTime n3 n9) 12)
(= (travelTime n3 n10) 10)
(= (travelTime n3 n11) 8)
(= (travelTime n4 n0) 9)
(= (travelTime n4 n1) 8)
(= (travelTime n4 n2) 10)
(= (travelTime n4 n3) 8)
(= (travelTime n4 n5) 3)
(= (travelTime n4 n6) 9)
(= (travelTime n4 n7) 7)
(= (travelTime n4 n8) 7)
(= (travelTime n4 n9) 8)
(= (travelTime n4 n10) 8)
(= (travelTime n4 n11) 0)
(= (travelTime n5 n0) 7)
(= (travelTime n5 n1) 5)
(= (travelTime n5 n2) 6)
(= (travelTime n5 n3) 7)
(= (travelTime n5 n4) 3)
(= (travelTime n5 n6) 7)
(= (travelTime n5 n7) 6)
(= (travelTime n5 n8) 4)
(= (travelTime n5 n9) 5)
(= (travelTime n5 n10) 5)
(= (travelTime n5 n11) 2)
(= (travelTime n6 n0) 0)
(= (travelTime n6 n1) 8)
(= (travelTime n6 n2) 8)
(= (travelTime n6 n3) 2)
(= (travelTime n6 n4) 9)
(= (travelTime n6 n5) 7)
(= (travelTime n6 n7) 2)
(= (travelTime n6 n8) 8)
(= (travelTime n6 n9) 11)
(= (travelTime n6 n10) 9)
(= (travelTime n6 n11) 8)
(= (travelTime n7 n0) 1)
(= (travelTime n7 n1) 8)
(= (travelTime n7 n2) 9)
(= (travelTime n7 n3) 1)
(= (travelTime n7 n4) 7)
(= (travelTime n7 n5) 6)
(= (travelTime n7 n6) 2)
(= (travelTime n7 n8) 9)
(= (travelTime n7 n9) 11)
(= (travelTime n7 n10) 9)
(= (travelTime n7 n11) 7)
(= (travelTime n8 n0) 9)
(= (travelTime n8 n1) 1)
(= (travelTime n8 n2) 3)
(= (travelTime n8 n3) 10)
(= (travelTime n8 n4) 7)
(= (travelTime n8 n5) 4)
(= (travelTime n8 n6) 8)
(= (travelTime n8 n7) 9)
(= (travelTime n8 n9) 2)
(= (travelTime n8 n10) 0)
(= (travelTime n8 n11) 6)
(= (travelTime n9 n0) 11)
(= (travelTime n9 n1) 3)
(= (travelTime n9 n2) 5)
(= (travelTime n9 n3) 12)
(= (travelTime n9 n4) 8)
(= (travelTime n9 n5) 5)
(= (travelTime n9 n6) 11)
(= (travelTime n9 n7) 11)
(= (travelTime n9 n8) 2)
(= (travelTime n9 n10) 2)
(= (travelTime n9 n11) 8)
(= (travelTime n10 n0) 9)
(= (travelTime n10 n1) 1)
(= (travelTime n10 n2) 3)
(= (travelTime n10 n3) 10)
(= (travelTime n10 n4) 8)
(= (travelTime n10 n5) 5)
(= (travelTime n10 n6) 9)
(= (travelTime n10 n7) 9)
(= (travelTime n10 n8) 0)
(= (travelTime n10 n9) 2)
(= (travelTime n10 n11) 7)
(= (travelTime n11 n0) 8)
(= (travelTime n11 n1) 8)
(= (travelTime n11 n2) 9)
(= (travelTime n11 n3) 8)
(= (travelTime n11 n4) 0)
(= (travelTime n11 n5) 2)
(= (travelTime n11 n6) 8)
(= (travelTime n11 n7) 7)
(= (travelTime n11 n8) 6)
(= (travelTime n11 n9) 8)
(= (travelTime n11 n10) 7)

(= (timeAt n0) 3)
(= (timeAt n1) 5)
(= (timeAt n2) 3)
(= (timeAt n3) 1)
(= (timeAt n4) 4)
(= (timeAt n5) 4)
(= (timeAt n6) 2)
(= (timeAt n7) 1)
(= (timeAt n8) 2)
(= (timeAt n9) 2)
(= (timeAt n10) 2)
(= (timeAt n11) 4)

(= (exp n0) 1)
(= (exp n1) 8)
(= (exp n2) 7)
(= (exp n3) 2)
(= (exp n4) 10)
(= (exp n5) 10)
(= (exp n6) 2)
(= (exp n7) 7)
(= (exp n8) 2)
(= (exp n9) 8)
(= (exp n10) 7)
(= (exp n11) 8)

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