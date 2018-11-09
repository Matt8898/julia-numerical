# Algorithm 3.2
# Newton's interpolatory divided difference.

function dividedDiff(x, y)
	n = length(x)
	out = zeros(n, n)
	for i ∈ 1:n
		out[i, 1] = y[i]
	end
	for i ∈ 2:n
		for j ∈ 2:i
			out[i, j] = (out[i, j - 1] - out[i - 1, j - 1]) / (x[i] - x[i - j + 1])
		end
	end
	return out
end

println(dividedDiff([1, 1.3, 1.6, 1.9, 2.2], [-0.76, -0.54, -0.57, -0.57, 0.3]))
