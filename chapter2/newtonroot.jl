# Algorithm 2.3
# Newton's method for finfing roots

function bisect_approx(f, fp, p0, tolerance, maxIter)
	for i ∈ 1:maxIter
		p = p0 - (f(p0)/fp(p0))
		if abs(p - p0) < tolerance
			return p
		end
		p0 = p
	end
	throw(ArgumentError("Method failed"))
end

println(bisect_approx(x->(cos(x) - x), x->(-sin(x) - 1), π/4, 0.1, 100))
