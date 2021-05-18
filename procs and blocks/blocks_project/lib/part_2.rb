def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    validEnds = ["com", "net", "io", "org"]

    arr.none? do |url| 
        validEnds.include?(url.split('.')[-1])
    end
end

