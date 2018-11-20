function swap_rows(mat, row1, row2)
	for i in 1:size(mat)[2]
		p1 = mat[row1, i]
		p2 = mat[row2, i]
		tmp = p1
		mat[row1, i] = p2
		mat[row2, i] = tmp
	end
	return mat
end

function solve_gauss(mat)
	n, m = size(mat)
	for k in 1:n
		max_row = 1
		max_val = 0
		for i in 1:n
			if mat[i, k] > max_val
				max_row = i
				max_val = mat[i, k]
			end
		end
		if max_val == 0
			println("No unique solution")
			return
		end

		if max_row != 1
			mat = swap_rows(mat, k, max_row)
		end

		for i in (k + 1):n
			m = mat[i, k]/mat[k, k]
			for j in k:(n + 1)
				mat[i, j] -= m*mat[k, j]
			end
		end
	end
	println(mat)
	x = zeros(1, n)
	x[n] = mat[n, n + 1]/mat[n ,n]
	for i in (n - 1):-1:1
		sum = 0
		for j in (i + 1):n
			sum = mat[i, j]*x[j]
		end
		x[i] = (mat[i, n + 1] - sum)*mat[i, i]
	end
	return x
end

A = [[1.0 1.0 2]; [2.0 -2.0 3.0];]
println(A)
A = solve_gauss(A)
println(A)
