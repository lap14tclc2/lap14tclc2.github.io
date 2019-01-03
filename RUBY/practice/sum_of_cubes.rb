def sum_of_cubes(a, b)
    # Write your code here
    sum = 0
    while(a <= b)
      sum += a*a*a
      a += 1
    end
    sum
end