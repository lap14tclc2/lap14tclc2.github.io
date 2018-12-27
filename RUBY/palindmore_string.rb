def palindmore(string)
    str = string.split(" ").join("")
    str.reverse.downcase == str.downcase
end 

palindmore("Never odd or even")