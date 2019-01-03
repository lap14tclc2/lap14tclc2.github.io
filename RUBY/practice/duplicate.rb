def non_duplicated_values(values)
    # Write your code here
    i = 0
    while i < values.size - 1
        if (values[i] == values[i+1])
            values[i] = nil
            values[i+1] = nil
        end 
        i += 1
    end
    values.compact
end
non_duplicated_values([1,2,2,3,3,4,5])