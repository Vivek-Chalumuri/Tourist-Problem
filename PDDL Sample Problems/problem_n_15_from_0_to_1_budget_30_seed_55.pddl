(define (problem LimitedTour)
(:domain Tourism)
(:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 - node)

(:init 

(= (travelTime n0 n1) 1)
(= (travelTime n0 n2) 7)
(= (travelTime n0 n3) 3)
(= (travelTime n0 n4) 3)
(= (travelTime n0 n5) 5)
(= (travelTime n0 n6) 4)
(= (travelTime n0 n7) 6)
(= (travelTime n0 n8) 6)
(= (travelTime n0 n9) 5)
(= (travelTime n0 n10) 4)
(= (travelTime n0 n11) 1)
(= (travelTime n0 n12) 2)
(= (travelTime n0 n13) 7)
(= (travelTime n0 n14) 7)
(= (travelTime n1 n0) 1)
(= (travelTime n1 n2) 5)
(= (travelTime n1 n3) 2)
(= (travelTime n1 n4) 2)
(= (travelTime n1 n5) 3)
(= (travelTime n1 n6) 5)
(= (travelTime n1 n7) 4)
(= (travelTime n1 n8) 6)
(= (travelTime n1 n9) 5)
(= (travelTime n1 n10) 5)
(= (travelTime n1 n11) 2)
(= (travelTime n1 n12) 2)
(= (travelTime n1 n13) 6)
(= (travelTime n1 n14) 5)
(= (travelTime n2 n0) 7)
(= (travelTime n2 n1) 5)
(= (travelTime n2 n3) 5)
(= (travelTime n2 n4) 4)
(= (travelTime n2 n5) 4)
(= (travelTime n2 n6) 9)
(= (travelTime n2 n7) 4)
(= (travelTime n2 n8) 9)
(= (travelTime n2 n9) 7)
(= (travelTime n2 n10) 8)
(= (travelTime n2 n11) 7)
(= (travelTime n2 n12) 7)
(= (travelTime n2 n13) 5)
(= (travelTime n2 n14) 2)
(= (travelTime n3 n0) 3)
(= (travelTime n3 n1) 2)
(= (travelTime n3 n2) 5)
(= (travelTime n3 n4) 1)
(= (travelTime n3 n5) 1)
(= (travelTime n3 n6) 3)
(= (travelTime n3 n7) 6)
(= (travelTime n3 n8) 4)
(= (travelTime n3 n9) 2)
(= (travelTime n3 n10) 3)
(= (travelTime n3 n11) 4)
(= (travelTime n3 n12) 5)
(= (travelTime n3 n13) 3)
(= (travelTime n3 n14) 3)
(= (travelTime n4 n0) 3)
(= (travelTime n4 n1) 2)
(= (travelTime n4 n2) 4)
(= (travelTime n4 n3) 1)
(= (travelTime n4 n5) 1)
(= (travelTime n4 n6) 5)
(= (travelTime n4 n7) 4)
(= (travelTime n4 n8) 5)
(= (travelTime n4 n9) 4)
(= (travelTime n4 n10) 4)
(= (travelTime n4 n11) 4)
(= (travelTime n4 n12) 4)
(= (travelTime n4 n13) 4)
(= (travelTime n4 n14) 3)
(= (travelTime n5 n0) 5)
(= (travelTime n5 n1) 3)
(= (travelTime n5 n2) 4)
(= (travelTime n5 n3) 1)
(= (travelTime n5 n4) 1)
(= (travelTime n5 n6) 5)
(= (travelTime n5 n7) 6)
(= (travelTime n5 n8) 4)
(= (travelTime n5 n9) 3)
(= (travelTime n5 n10) 4)
(= (travelTime n5 n11) 6)
(= (travelTime n5 n12) 6)
(= (travelTime n5 n13) 2)
(= (travelTime n5 n14) 2)
(= (travelTime n6 n0) 4)
(= (travelTime n6 n1) 5)
(= (travelTime n6 n2) 9)
(= (travelTime n6 n3) 3)
(= (travelTime n6 n4) 5)
(= (travelTime n6 n5) 5)
(= (travelTime n6 n7) 9)
(= (travelTime n6 n8) 2)
(= (travelTime n6 n9) 3)
(= (travelTime n6 n10) 1)
(= (travelTime n6 n11) 5)
(= (travelTime n6 n12) 6)
(= (travelTime n6 n13) 6)
(= (travelTime n6 n14) 7)
(= (travelTime n7 n0) 6)
(= (travelTime n7 n1) 4)
(= (travelTime n7 n2) 4)
(= (travelTime n7 n3) 6)
(= (travelTime n7 n4) 4)
(= (travelTime n7 n5) 6)
(= (travelTime n7 n6) 9)
(= (travelTime n7 n8) 10)
(= (travelTime n7 n9) 9)
(= (travelTime n7 n10) 9)
(= (travelTime n7 n11) 5)
(= (travelTime n7 n12) 4)
(= (travelTime n7 n13) 8)
(= (travelTime n7 n14) 6)
(= (travelTime n8 n0) 6)
(= (travelTime n8 n1) 6)
(= (travelTime n8 n2) 9)
(= (travelTime n8 n3) 4)
(= (travelTime n8 n4) 5)
(= (travelTime n8 n5) 4)
(= (travelTime n8 n6) 2)
(= (travelTime n8 n7) 10)
(= (travelTime n8 n9) 1)
(= (travelTime n8 n10) 1)
(= (travelTime n8 n11) 7)
(= (travelTime n8 n12) 8)
(= (travelTime n8 n13) 4)
(= (travelTime n8 n14) 6)
(= (travelTime n9 n0) 5)
(= (travelTime n9 n1) 5)
(= (travelTime n9 n2) 7)
(= (travelTime n9 n3) 2)
(= (travelTime n9 n4) 4)
(= (travelTime n9 n5) 3)
(= (travelTime n9 n6) 3)
(= (travelTime n9 n7) 9)
(= (travelTime n9 n8) 1)
(= (travelTime n9 n10) 2)
(= (travelTime n9 n11) 7)
(= (travelTime n9 n12) 7)
(= (travelTime n9 n13) 2)
(= (travelTime n9 n14) 5)
(= (travelTime n10 n0) 4)
(= (travelTime n10 n1) 5)
(= (travelTime n10 n2) 8)
(= (travelTime n10 n3) 3)
(= (travelTime n10 n4) 4)
(= (travelTime n10 n5) 4)
(= (travelTime n10 n6) 1)
(= (travelTime n10 n7) 9)
(= (travelTime n10 n8) 1)
(= (travelTime n10 n9) 2)
(= (travelTime n10 n11) 5)
(= (travelTime n10 n12) 6)
(= (travelTime n10 n13) 5)
(= (travelTime n10 n14) 6)
(= (travelTime n11 n0) 1)
(= (travelTime n11 n1) 2)
(= (travelTime n11 n2) 7)
(= (travelTime n11 n3) 4)
(= (travelTime n11 n4) 4)
(= (travelTime n11 n5) 6)
(= (travelTime n11 n6) 5)
(= (travelTime n11 n7) 5)
(= (travelTime n11 n8) 7)
(= (travelTime n11 n9) 7)
(= (travelTime n11 n10) 5)
(= (travelTime n11 n12) 1)
(= (travelTime n11 n13) 8)
(= (travelTime n11 n14) 7)
(= (travelTime n12 n0) 2)
(= (travelTime n12 n1) 2)
(= (travelTime n12 n2) 7)
(= (travelTime n12 n3) 5)
(= (travelTime n12 n4) 4)
(= (travelTime n12 n5) 6)
(= (travelTime n12 n6) 6)
(= (travelTime n12 n7) 4)
(= (travelTime n12 n8) 8)
(= (travelTime n12 n9) 7)
(= (travelTime n12 n10) 6)
(= (travelTime n12 n11) 1)
(= (travelTime n12 n13) 8)
(= (travelTime n12 n14) 7)
(= (travelTime n13 n0) 7)
(= (travelTime n13 n1) 6)
(= (travelTime n13 n2) 5)
(= (travelTime n13 n3) 3)
(= (travelTime n13 n4) 4)
(= (travelTime n13 n5) 2)
(= (travelTime n13 n6) 6)
(= (travelTime n13 n7) 8)
(= (travelTime n13 n8) 4)
(= (travelTime n13 n9) 2)
(= (travelTime n13 n10) 5)
(= (travelTime n13 n11) 8)
(= (travelTime n13 n12) 8)
(= (travelTime n13 n14) 3)
(= (travelTime n14 n0) 7)
(= (travelTime n14 n1) 5)
(= (travelTime n14 n2) 2)
(= (travelTime n14 n3) 3)
(= (travelTime n14 n4) 3)
(= (travelTime n14 n5) 2)
(= (travelTime n14 n6) 7)
(= (travelTime n14 n7) 6)
(= (travelTime n14 n8) 6)
(= (travelTime n14 n9) 5)
(= (travelTime n14 n10) 6)
(= (travelTime n14 n11) 7)
(= (travelTime n14 n12) 7)
(= (travelTime n14 n13) 3)

(= (timeAt n0) 1)
(= (timeAt n1) 4)
(= (timeAt n2) 4)
(= (timeAt n3) 1)
(= (timeAt n4) 2)
(= (timeAt n5) 1)
(= (timeAt n6) 1)
(= (timeAt n7) 2)
(= (timeAt n8) 3)
(= (timeAt n9) 3)
(= (timeAt n10) 2)
(= (timeAt n11) 2)
(= (timeAt n12) 2)
(= (timeAt n13) 2)
(= (timeAt n14) 2)

(= (exp n0) 7)
(= (exp n1) 9)
(= (exp n2) 6)
(= (exp n3) 9)
(= (exp n4) 5)
(= (exp n5) 7)
(= (exp n6) 9)
(= (exp n7) 5)
(= (exp n8) 8)
(= (exp n9) 8)
(= (exp n10) 1)
(= (exp n11) 7)
(= (exp n12) 2)
(= (exp n13) 3)
(= (exp n14) 2)

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
(notVisited n12)
(notVisited n13)
(notVisited n14)

(= (maxTime) 30)
(= (timeCost) 0)
(= (fun) 0)

)

(:goal (at n1))
(:metric maximize (fun))

)