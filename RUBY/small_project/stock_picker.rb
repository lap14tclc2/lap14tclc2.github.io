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
  record.each do |(key,value)|
    return key if value == record.values.max
  end
    
end

p stock_picker([17,3,6,9,15,8,6,1,10])

