def partition(array, num)
    sub1 = []
    sub2 = []

    array.each do |el|
        if el < num
            sub1 << el
        else
            sub2 << el
        end
    end

    [sub1, sub2]
end

def merge(hash1, hash2)
    res = {}

    hash1.each_key { |key| res[key] = hash1[key] }
    hash2.each_key { |key| res[key] = hash2[key] }

    res
end

def censor(string, cursedWords)
    res = []

    string.split(' ').each do |word| 
        if cursedWords.include?(word.downcase)
            temp = ''

            word.each_char do |char|
                if char.downcase.match?(/[aeiou]/)
                    temp += '*'
                else
                    temp += char
                end
            end

            res << temp
        else
            res << word
        end
    end

    res.join(' ')
end

def power_of_two? number
    return true if number === 1

    tempN = number

    while tempN >= 2
        return true if tempN === 2
        tempN /= 2
    end

    false
end