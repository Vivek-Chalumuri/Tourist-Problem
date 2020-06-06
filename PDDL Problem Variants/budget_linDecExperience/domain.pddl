(define (domain Tourism)
(:requirements :typing :fluents)
(:types node)
(:predicates
	(at ?n - node)
	(haveVisited ?n - node)
	(notVisited ?n - node)
)
(:functions
    (timeCost)
    (fun)
    (travelTime ?n ?n - node)
    (timeAt ?n - node)
    (exp ?n - node)
    (maxTime)
    (budgetCost)
    (budgetAt ?n - node)
    (maxBudget)
)

(:action visit
	:parameters (?from ?to)
	:precondition (
					and (at ?from) 
					    (haveVisited ?from)
					    (notVisited ?to)
						(<= (+ (+ (timeCost) (travelTime ?from ?to)) (timeAt ?to)) (maxTime))
						(<= (+ (budgetCost) (budgetAt ?to)) (maxBudget))
				)
	:effect (
				and (at ?to)
				    (haveVisited ?to)
                    (not (notVisited ?to))
					(not (at ?from))
					(increase (timeCost) (+ (travelTime ?from ?to) (timeAt ?to)))
					(increase (budgetCost) (budgetAt ?to))
					(increase (fun) (* (exp ?to) (- 1.00 (/ (timeCost) (maxTime)))))
			)
)
)
