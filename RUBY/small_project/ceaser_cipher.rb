def valid_character(c)
    # a-z has range from 65 to 90
    # A-Z has range from 97 to 122
    r1 = 65...91
    r2 = 97...123
    (r1.cover?(c.ord) || r2.cover?(c.ord))
end
def cipher(char, fixed_number)
    ciphered_char = (char.ord + fixed_number).chr 
    if (ciphered_char > "z")
        ciphered_char = (ciphered_char.ord - "z".ord - 1 + "a".ord ).chr
    end 

    if (ciphered_char > "Z" && ciphered_char < "a")
        ciphered_char = (ciphered_char.ord - "Z".ord - 1 + "A".ord).chr
    end

    ciphered_char
end

def ceaser_cipher(string, fixed_number)
    index = 0
    ciphered_string = ""
    while (index < string.size)
        char = string[index] 
        # if this character is alphabet letter then encrypt it. Otherwise let string add origin character
        if (valid_character(char))
            ciphered_char = cipher(char, fixed_number)
            ciphered_string << ciphered_char 
        else 
            ciphered_string << char
        end
        index += 1
    end 
    ciphered_string
end
puts ceaser_cipher("WHAT A STRING", 5)