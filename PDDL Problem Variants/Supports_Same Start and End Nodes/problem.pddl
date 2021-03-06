(define (problem LimitedTour)
(:domain Tourism)
(:objects n1 n2 n3 n4 - node)
(:init
	(= (travelTime n1 n2) 10) (= (travelTime n2 n1) 10)
	(= (travelTime n1 n3) 15) (= (travelTime n3 n1) 15)
	(= (travelTime n1 n4) 25) (= (travelTime n4 n1) 25)
	(= (travelTime n2 n3) 20) (= (travelTime n3 n2) 20)
	(= (travelTime n2 n4) 15) (= (travelTime n4 n2) 15)
	(= (travelTime n3 n4) 15) (= (travelTime n4 n3) 15)
	(= (timeAt n1) 20) (= (timeAt n2) 5)
	(= (timeAt n3) 45) (= (timeAt n4) 20)
	(= (exp n1) 35) (= (exp n2) 12)
	(= (exp n3) 70) (= (exp n4) 40)
	(= (fun) 0) (= (maxTime) 1000) (= (timeCost) 0)
	(at n2) (isGoal n2)
)
(:goal (and (at n2) (< 0 (fun))))
(:metric maximize (fun))
)
