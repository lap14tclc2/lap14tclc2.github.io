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
    length = calculated_length_of_loop(arr.size)
    index = 0
    while (index < length)
        buy_date = get_random_number(arr)
        sell_date = get_random_number(arr)
        calculated_price = arr[sell_date] - arr[buy_date]
        if (buy_date < sell_date && calculated_price > 0 )
            record[[buy_date, sell_date]] = calculated_price
            index += 1
        end
    end
    
    record.each do |(key,value)|
        return key if value == record.values.max
    end
    
end

p stock_picker([17,3,6,9,15,8,6,1,10])

