# Algorithm 3.1
# Neville polynomial interpolation.

function neville(x, y, x0)
	n = length(x)
	q = zeros(n, n)
	for i ∈ 1:n
		q[i, 1] = y[i];
	end
	for i ∈ 2:n
		for j ∈ i:n
			q[j,i] = ((x0 - x[j-i+1]) * q[j,i-1] - (x0 - x[j]) * q[j-1,i-1]) / (x[j] - x[j-i+1])
		end
	end
	return q[n,n]
end

println(neville([1, 56, 73], [67, 5, 35], 3))
