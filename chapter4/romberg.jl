function romberg(f, a, b, n)
	r = zeros(2, n)
	h = b - a
	r[1, 1] = (h/2) * (f(a) + f(b))
	for i ∈ 2:n
		tsum = 0
		for k ∈ 1:(2^(i - 2))
			tsum += f(a + (k - 0.5) * h)
		end
		r[2, 1] = (1/2)*(h*tsum + r[1, 1])
		for j ∈ 2:i
			r[2, j] = r[2, j - 1] + (r[2, j - 1] - r[1, j - 1])/(4^(j - 1) - 1)
		end
		h = h/2
		for j ∈ 1:i
			r[1, j] = r[2, j]
		end
	end
	return r[2, n]
end

f(x) = sin(x)
println(romberg(f, 0, 3, 20))
