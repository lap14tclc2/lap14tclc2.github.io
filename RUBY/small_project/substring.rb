dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def is_occur(word, dictionary_word)
    #check whether word is including dictionary's word or not
    word.downcase.include?(dictionary_word.downcase)
end

def substring(string, dictionary)
    #replace all of special character in string to space and convert string to array
    string.gsub!(/[^a-zA-Z]'/, ' ')
    arr = string.split(' ')
    p arr

    record = Hash.new
    for dict_word in dictionary 
        count = 0
        for word in arr
            if (is_occur(word, dict_word))
                count += 1
            end
        end
        if count > 0
            record[dict_word] = count 
        end
    end
    record
end

p substring("Howdy partner, sit down! How's it going?", dictionary)
