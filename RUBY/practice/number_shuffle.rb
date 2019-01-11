def to_array(k)
    arr = []
    while k != 0
        arr << k % 10
        k /= 10
    end
    arr
end

def to_number(arr)
    arr.join().to_i
end

def number_shullfe(number)
    arr = to_array(number)
    if !(arr.size == 3 || arr.size == 4)
        return
    end 

    # calculate size of sorted array
    length = 1 
    sorted_array = []        
    for i in 1..arr.size
        length *= i 
    end 
    
    #loop until sorted_array.size equal arr.size!
    index = 0
    while index < length 
        tmp = to_number(arr.shuffle)
        # if sorted_array not include the shuffled number then let that array add it
        if !sorted_array.include?(tmp)
            sorted_array << tmp
            index += 1
        end
    end
    sorted_array
end 

puts number_shullfe(123)

