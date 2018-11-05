# Algorithm 2.4
# Secant method for finding roots, approximates the derivative of f(x)

function secant_approx(f, p0, p1, tolerance, maxIter)
	for i ∈ 2:maxIter
		q0 = f(p0)
		q1 = f(p1)
		p = p1 - q1*(p1 - p0)/(q1 - q0)
		if abs(p - p1) < tolerance
			return p
		end
		p0 = p1
		q0 = q1
		p1 = p
		q1 = f(p)
	end
	throw(ArgumentError("Method failed"))
end

println(secant_approx(x->(cos(x) - x), 0.5, π/4, 0.1, 100))
