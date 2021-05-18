def select_even_nums nums 
    nums.select(&:even?)
end

def reject_puppies dogs
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays arr 
    arr.count do |subarr| 
        subarr.reduce { |prev, num| prev + num } > 0
    end
end

def aba_translate string
    arr =  []
    string.each_char.with_index do |char, i|
        if char.match(/[a|e|i|o|u]/)
            arr << char + "b" + char
        else
            arr << char
        end 
    end

    arr.join
end

def aba_array arr
    arr.map { |string| aba_translate(string) }
end
