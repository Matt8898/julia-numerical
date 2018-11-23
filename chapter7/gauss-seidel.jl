# Algorithm 7.2
# Gauss-Seidel Iteration

using LinearAlgebra

function gaussseidel(mat, approx, known, maxIter, tol)
	n, m = size(mat)
	sol = Vector(undef, n)
	a = mat
	for k in 1:maxIter
		for i in 1:n
			sum1 = 0
			for j in 1:(i - 1)
				if j != i
					sum1 += (a[i, j]*x[j])
				end
			end
			sum2 = 0
			for j in (i + 1):n
				if j != i
					sum2 += (a[i, j]*approx[j]) + known[i]
				end
			end
			sol[i] = (-sum1 - sum2)/a[i, i]
		end
		if LinearAlgebra.norm(sol - approx) < tol
			println("Success")
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
println(gaussseidel(A, x, b, 90, 0.001))
