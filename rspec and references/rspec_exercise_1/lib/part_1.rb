def average(a, b)
    (a+b) / 2.0
end

def average_array array
    (array.inject { |acc, num| acc + num }) / array.length.to_f
end

def repeat(word, times)
    res = ''
    (0...times).each { |el| res += word }

    res
end

def yell string
    res = ''
    string.each_char { |char| res += char.upcase }

    res + '!'
end

def alternating_case string
    res = []

    string.split(' ').each.with_index do |el, index|
        if index.even?
            res << el.upcase
        else
            res << el.downcase
        end
    end

    res.join(' ')
end
