function horner(coeff, x0)
	degree = length(coeff) - 1
	y = coeff[1]
	z = 0
	for j ∈ 2:(degree + 1)
		println(coeff[j])
		z = y + x0 * z
		y = x0 * y + coeff[j]
	end
	return (y, z)
end

println(horner([5, 2, 1], 5)[1])
