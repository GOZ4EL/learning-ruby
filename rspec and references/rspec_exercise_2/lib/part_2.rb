def palindrome? string
    reversedString = ""
    i = string.length - 1

    while i >= 0
        reversedString += string[i]
        i -= 1
    end

    string === reversedString
end

def substrings string
    res = []
    i = 0

    while i < string.length
        j = i
        word = ''

        while j < string.length
            word += string[j]
            res << word
            j += 1
        end
        i += 1
    end

    res
end

def palindrome_substrings string
    substrings(string).filter { |el| palindrome?(el) && el.length > 1 }
end
