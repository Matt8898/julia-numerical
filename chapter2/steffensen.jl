# Algorithm 2.6
# Newton's method for solving f(x) = x given an approximation

function bisect_approx(f, p0, tolerance, maxIter)
	for i ∈ 1:maxIter
		p1 = f(p0)
		p2 = f(p1)
		p = p0 - ((p1 - p0)^2)/(p2 - 2p1 + p0)
		if abs(p - p0) < tolerance
			return p
		end
		p0 = p
	end
	throw(ArgumentError("Method failed"))
end

println(bisect_approx(x->((10/(4 + x))^(1/2)), 1.5, 0.0001, 5))
