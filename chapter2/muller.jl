# Algorithm 2.8
# Approximate the root of a function by constructing a parabola
# between three points and intersect it with y = 0 to find the
# next approximation.

function muller(f, x0, x1, x2, tol, n0)
	h1 = x1 - x0
	h2 = x2 - x1
	δ1 = (f(x1) - f(x0))/h1
	δ2 = (f(x2) - f(x1))/h2
	d = (δ2 - δ1)/(h2 + h1)
	for i ∈ 3:n0
		b = δ2 + h2 * d
		D = (b^2 -4f(x2)d)^(1/2)
		E = 0
		if abs(b - D) < abs(b + D)
			E = b + D
		else
			E = b - D
		end
		h = (-2f(x2))/E
		p = x2 + h
		if abs(h) < tol
			return p
		end
		x0 = x1
		x1 = x2
		x2 = p
		h1 = x1 - x0
		h2 = x2 - x1
		δ1 = (f(x1) - f(x0))/h1
		δ2 = (f(x2) - f(x1))/h2
		d = (δ2 - δ1)/(h2 + h1)
	end
	throw(ArgumentError("Method failed"))
end

println(muller(x -> (16x^4 - 40x^3 + 5x^2 + 20x +6), 0.5, 1.0, 1.5, 10^-5, 50))
