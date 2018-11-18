# Algorithm 5.2
# Fourth order Runge-Kutta

function rk4(f, a, b, N, α)
	result = Tuple{Float64, Float64}[]
	k = Array{Float64}(undef, 4)
	h = (b - a)/N
	t = α
	ω = α
	push!(result, (t, ω))
	for i ∈ 1:N
		k[1] = h*f(t, ω)
		k[2] = h*f(t + h/2, ω + k[1]/2)
		k[3] = h*f(t + h/2, ω + k[2]/2)
		k[4] = h*f(t + h, ω + k[3])
		ω = ω +(k[1] + 2k[2] + 2k[3] + k[4])/6
		t = a + i*h
		push!(result, (t, ω))
	end
	return result
end

f(t, y) = y -t^2 + 1
println(rk4(f, 0, 2, 10, 0.5))
