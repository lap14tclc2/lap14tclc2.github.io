def get_random_number(arr)
  rand = Random.new
  return rand.rand(0..arr.size-1)
end

def calculated_length_of_loop(size)
  n_factorial = 1
  sub_factorial = 1

  for i in 1..size
    n_factorial *= i 
  end

  for i in 1..size-2
    sub_factorial *= i 
  end

  n_factorial /(sub_factorial * 2)
end

def stock_picker(arr)
  record = Hash.new

  outer_index = 0
  while (outer_index < arr.size - 1)
    inner_index = outer_index + 1
    while (inner_index < arr.size)
      price = arr[inner_index] - arr[outer_index]
      if (price > 0)
        record[[outer_index, inner_index]] = price 
      end 
      inner_index += 1
    end
    outer_index += 1
  end
  p record
  record.each do |(key,value)|
    return key if value == record.values.max
  end
    
end

p stock_picker([17,3,6,9,15,8,6,1,10])

