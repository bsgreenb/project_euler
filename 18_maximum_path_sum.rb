# Maximum path sum I
# Problem 18
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:
#

#
# NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

# I'm going to begin implementing without Memoization.  I think memoization will be the answer thought

triangle = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

triangle = triangle.split("\n")

triangle.each_with_index do |row, i|
  triangle[i] = row.split(" ").map(&:to_i)
end

def maximum_path_sum(triangle, i=0, j=0)
  # Base case
  puts "HERE with #{i}, #{j}"
  if triangle[i+1].nil?
    return triangle[i][j]
  else
    left_down_sum = triangle[i][j] + maximum_path_sum(triangle, i+1, j)
    left_right_sum =  triangle[i][j] + maximum_path_sum(triangle, i+1, j+1)

    return [left_down_sum, left_right_sum].max
  end
end

puts maximum_path_sum(triangle)
