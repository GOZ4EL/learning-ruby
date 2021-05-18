def hipsterfy word
    res = []
    found = false
    i = word.length - 1

    while i >= 0
        if word[i].match?(/[aeiou]/) && !found
            found = true
        else
            res.unshift(word[i])
        end

        i -= 1
    end

    res.join
end

def vowel_counts string
    hash = Hash.new(0)

    string.each_char do |char|
        hash[char.downcase] += 1 if char.downcase.match?(/[aeiou]/)

    end

    hash
end

def caesar_cipher(message, n)
    letters = "abcdefghijklmnopqrstuvwxyz"
    res = ''

    return message if n > 25

    message.each_char do |char|
        if letters.include?(char)
            if (letters.index(char) + n) > 25
                res += letters[letters.index(char) + n - 26]
            else
                res += letters[letters.index(char) + n]
            end
        else
            res += char;
        end
    end

    res
end