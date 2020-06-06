(define (domain Tourism)
(:requirements :typing :fluents)
(:types node)
(:predicates
	(at ?n - node)
	(haveVisited ?n - node)
	(isGoal ?n - node)
)
(:functions
    (timeCost)
    (fun)
    (travelTime ?n ?n - node)
    (timeAt ?n)
    (exp ?n - node)
    (maxTime)
)

(:action visit
	:parameters (?from ?to)
	:precondition (
			and (at ?from) 
			(or (not (haveVisited ?to)) (isGoal ?to) )
			(<= (+ (+ (timeCost) (travelTime ?from ?to)) (timeAt ?to)) (maxTime))	)
	:effect (
			and (at ?to)
			(not (at ?from))
			(not (isGoal ?to))
			(haveVisited ?to)
			(increase (timeCost) (+ (travelTime ?from ?to) (timeAt ?to)))
			(increase (fun) (exp ?to))	)
)
)
