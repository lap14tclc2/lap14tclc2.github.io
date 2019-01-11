def palindmore(string)
    str = string.split(" ").join("")
    str.reverse.downcase == str.downcase
end 

p palindmore("Never odd or even")