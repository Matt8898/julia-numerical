# Algorithm 2.5
# False Position method for finding roots
# Same as the secant method, but it checks
# if the roots are bracketed between successive
# iterations.

function false_approx(f, p0, p1, tolerance, maxIter)
	for i ∈ 2:maxIter
		q0 = f(p0)
		q1 = f(p1)
		p = p1 - q1*(p1 - p0)/(q1 - q0)
		if abs(p - p1) < tolerance
			return p
		end
		q = f(p)
		if q ⋅ q1 < 0
			p0 = p1
			q0 = q1
		end
		p1 = p
		q1 = q
	end
	throw(ArgumentError("Method failed"))
end

println(false_approx(x->(cos(x) - x), 0.5, π/4, 0.1, 100))
