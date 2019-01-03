def sort_string(string)
    # your code here
    result = string.split(" ").sort do |a,b|
        case
        when a.length < b.length
            -1
        when a.length > b.length
            1
        else
            0
        end 
    end 
    result.join(" ")
end
puts sort_string("Awesome I am")