# Algorithm 7.1
# Jacobi Iteration

using LinearAlgebra

function jacobi(mat, approx, known, maxIter, tol)
	n, m = size(mat)
	sol = Vector(undef, n)
	a = mat
	for k in 1:maxIter
		for i in 1:n
			sum = 0
			for j in 1:n
				if j != i
					sum += (a[i, j]*approx[j]) + known[i]
				end
			end
			sol[i] = (-sum)/a[i, i]
		end
		if LinearAlgebra.norm(sol - approx) < tol
			break
		end
		for i in 1:n
			approx[i] = sol[i]
		end
	end
	return sol
end

A = [[1.0 1.33]; [2.0 -2.55];]
x = [0.0, 0.0]
b = [2.0, 5.0]
println(jacobi(A, x, b, 50, 0.001))
