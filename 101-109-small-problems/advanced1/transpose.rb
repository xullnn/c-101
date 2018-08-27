# Understand the problem
# map + index 0 ,1 ,2
  # nest in another (0..2) iteration
#   matrix = [
#     [1, 5, 8],
#     [4, 7, 2],
#     [3, 9, 6]
#   ]
#
# def new_transpose(matrix)
#   matrix.map.with_index do |arr, i|
#     (0..2).each_with_object([]) do |n, new_arr|
#       new_arr << matrix[n][i]
#     end
#   end
# end

# new_matrix = new_transpose(matrix)
#
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


def new_transpose(matrix)
  (0..matrix[0].size-1).map do |vertical|
    matrix.map do |core|
      core[vertical]
    end
  end
end



p new_transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p new_transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p new_transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p new_transpose([[1]]) == [[1]]
