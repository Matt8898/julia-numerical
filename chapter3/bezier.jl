# Algorithm 3.6
# Bezier Curve

function bezier(n, x, xp, xn, y, yp, yn)
	a = zeros(1, 3)
	b = zeros(1, 3)
	for i ∈ 1:(n - 1)
		a[1] = x[i]
		b[1] = y[i]
		a[2] = 3(xp[i] - x[i])
		b[2] = 3(yp[i] - y[i])
		a[3] = 3(x[i] + xn[i + 1] -2xp[i])
		b[3] = 3(y[i] + yn[i + 1] -2yp[i])
		a[4] = x[i + 1] - x[i] + 3xp[i] -3xn[i + 1]
		a[4] = y[i + 1] - y[i] + 3yp[i] -3yn[i + 1]
	end
end
