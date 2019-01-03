def kaprekar?(k)
    n = find_num_digits(k)
    str = (k ** 2).to_s
    first_cal = (str[0..n-2].to_i * (10**n) + str[n-1..str.size].to_i)
    second_cal = (str[0..n-1].to_i * (10**n) + str[n..str.size].to_i)
    target = k **2 
    first_cal == target || second_cal == target
end

def find_num_digits(k)
    count = 0
    while k != 0
        k = k / 10
        count += 1
    end
    count
end

puts kaprekar?(55)