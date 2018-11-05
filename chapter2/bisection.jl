# Algorithm 2.1
# Bisection algorithm for finding the solutions to f(x) = 0

function bisect_approx(f, a, b, tolerance, maxIter)
	fa = f(a)
	for i ∈ 1:maxIter
		p = a + (b - a)/2
		fp = f(p)
		if fp == 0 || (b - a)/2 < tolerance
			return p
		end
		if sign(fa) == sign(fp)
			a = p
		else
			b = p
		end
	end
	throw(ArgumentError("Method failed"))
end

println(bisect_approx(sin, 1, 2π, 0.01, 100))
