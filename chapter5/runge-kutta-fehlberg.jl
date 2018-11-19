# Algorithm 5.3
# Runge Kutta Fehlberg

function rkf(f, a, b, α, max_step, min_step, tolerance)
	flag = 1
	result = Tuple{Float64, Float64, Float64}[]
	t = a
	k = Array{Float64}(undef, 6)
	h = max_step
	ω = α
	push!(result, (t, ω, h))
	while flag == 1
		k[1] = h*f(t, ω)
		k[2] = h*f(t + (1/4)*h, ω + (1/4)*k[1])
		k[3] = h*f(t + (3/8)*h, ω + (3/32)*k[1] + (9/32)*k[2])
		k[4] = h*f(t + (12/13)*h, ω + (1932/2197)*k[1] - (7200/2197)*k[2] + (7296/2197)*k[3])
		k[5] = h*f(t + h, ω + (439/216)*k[1] - 8*k[2] + (3680/513)*k[3] - (845/4104)*k[4])
		k[6] = h*f(t + (1/2)*h, ω - (8/27)*k[1] + 2*k[2] - (3544/2565)*k[3] + (1859/4104)*k[4] - (11/40)*k[5])
		R = (1/h)*abs((1/360)*k[1] - (128/4275)*k[3] - (2197/75240)*k[4] + (1/50)*k[5] + (2/55)k[6])
		if R <= tolerance
			t = t + h
			ω = ω + (25/216)*k[1] + (1408/25655)*k[3] + (21977/4104)*k[4] - (1/5)*k[5]
			push!(result, (t, ω, h))
		end
		δ = 0.84 * (tolerance/R)^(1/4)
		if δ <= 0.1
			h = 0.1*h
		elseif δ >= 4
			h = 4h
		else
			h = δ*h
		end
		if h > max_step
			h = max_step
		end
		if t >= b
			flag = 0
		elseif (t + h) > b
			h = b - t
		elseif h < min_step
			flag = 0
		end
	end
	return result
end

f(t, y) = y - t^2 + 1
println(rkf(f, 0, 2, 0.5, 0.25, 0, 10^(-5)))
