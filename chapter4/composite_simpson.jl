function integrate(f, a, b, n)
	h = (b - a) / n
	x = zeros(1, 3)
	x[1] = f(a) + f(b)
	for i ∈ 1:(n - 1)
		X = a + i*h
		if iseven(i)
			x[3] += f(X)
		else
			x[2] += f(X)
		end
	end
	return h*(x[1] + 2*x[3] + 4*x[2])/3
end

f(x) = x
println(integrate(f, 0, 3, 100))
