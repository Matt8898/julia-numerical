# Algorithm 3.3
# Hermite Interpolation

function hermite_interpolate(x, y, yp)
	n = length(x)
	Q = zeros(2n + 1, 2n + 1)
	z = zeros[1, 2n + 1]
	for i ∈ 1:n
		z[2i] = x[i]
		z[2i + 1] = x[i]
		Q[2i, 1] = y[i]
		Q[2i + 1, 2] = yp[i]

		if i ≠ 1
			Q[2i, 2] = (Q[2i, 1] - Q[2i - 1, 1])/(z[2i] - z[2i - 1])
		end
	end
	for i ∈ 3:(2n + 1)
		for j ∈ 3:i
			Q[i, j] = (Q[i, j - 1] - Q[i - 1, j - 1])/(z[i] - z[i - j])
		end
	end
	return diag(Q)
end

print(hermite_interpolate([1, 2, 3], [0.84, 0,91, 0,14], [0.54, -0.41, -0.98]))
