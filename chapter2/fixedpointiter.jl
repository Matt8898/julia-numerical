# Algorithm 2.2
# Fixed point iteration, solves g(p) = p

function bisect_approx(f, p0, tolerance, maxIter)
	for i ∈ 1:maxIter
		p = f(p0)
		if abs(p - p0) < tolerance
			return p
		end
		p0 = p
	end
	throw(ArgumentError("Method failed"))
end

println(bisect_approx(x -> ((10/(4 + x))^(1/2)), 1.5, 0.1, 4))
