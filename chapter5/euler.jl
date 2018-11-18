# Algorithm 5.1
# Euler's method

function euler(f, a, b, N, α)
	result = Tuple{Float64, Float64}[]
	h = (b - a)/N
	t = α
	ω = α
	push!(result, (t, ω))
	for i ∈ 1:N
		ω = ω + h*f(t, ω)
		t = a + i*h
		push!(result, (t, ω))
	end
	return result
end

f(t, y) = y -t^2 + 1
println(euler(f, 0, 2, 10, 0.5))
