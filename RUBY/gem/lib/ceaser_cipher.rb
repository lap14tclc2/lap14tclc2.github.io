def valid_character(c)
  r1 = 65...91
  r2 = 97...123
  (r1.cover?(c.ord) || r2.cover?(c.ord))
end

def cipher(char, fixed_number)
  ciphered_char = (char.ord + fixed_number).chr 
  if (fixed_number >= 0)
    if (ciphered_char > "z")
        ciphered_char = (ciphered_char.ord - "z".ord - 1 + "a".ord ).chr
    end 

    if (ciphered_char > "Z" && ciphered_char < "a")
        ciphered_char = (ciphered_char.ord - "Z".ord - 1 + "A".ord).chr
    end
  else
    if (ciphered_char < "a" && ciphered_char > "Z")
        ciphered_char = (ciphered_char.ord + "z".ord - "a".ord + 1).chr
    end

    if (ciphered_char < "A")
        ciphered_char = (ciphered_char.ord + "Z".ord - "A".ord + 1).chr
    end
  end
  ciphered_char
end

def ceaser_cipher(string, fixed_number)
  index = 0
  ciphered_string = ""
  while (index < string.size)
    char = string[index] 
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
