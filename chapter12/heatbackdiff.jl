#Algorithm 12.2
#Heat equation with backwards-difference
#Boundary conditions u(0, t) = u(l, t) = 0, 0 < t < T

using Printf

function heatbd(f, L, T, α, m, N)
	w = zeros(Float64, m)
	l = zeros(Float64, m)
	u = zeros(Float64, m)
	z = zeros(Float64, m)
	h = L/m
	k = T/N
	λ = k*α^2/h^2
	for i ∈ 1:(m - 1)
		w[i] = f(i * h)
	end
	l[1] = 1 + 2λ
	u[1] = -λ/l[1]
	for i ∈ 2:(m - 2)
		l[i] = 1 + 2λ + λ*u[i - 1]
		u[i] = -λ/l[i]
	end
	l[m - 1] = 1 + 2λ + λ*u[m - 2]
	for j ∈ 1:N
		t = j*k
		z[1] = w[1] / l[1]
		for i ∈ 2:(m - 1)
			z[i] = (w[i] + λ*z[i - 1])/l[i]
		end
		w[m - 1] = z[m - 1]
		for i ∈ (m - 2):1
			w[i] = z[i][t] - u[i]w[i+1]
		end
		for i ∈ 1:(m - 1)
			x = i*h
			println(x, w[i])
			x = i * h
			@printf("%3d %11.8f %14.8f\n", i, x, w[i])
		end
	end
end

function distrib(x)
	return sin(π*x)
end

heatbd(distrib, 1, 10, 0.5, 100, 100)
