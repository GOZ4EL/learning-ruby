# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def largest_prime_factor num
    divisors = []
    max = 0

    (1..num).each { |el| divisors << el if num % el === 0 && isPrime(el)}

    max = divisors[0]

    divisors.each do |el|
        max = el if el > max 
    end

    max
end

def isPrime num
    return false if num < 2

    (2...num).each { |el| return false if num % el === 0 }

    true
end

def unique_chars? string
    hash = Hash.new(0)

    string.each_char do |char| 
        hash[char] += 1
        return false if hash[char] > 1
    end

    true
end

def dupe_indices arr
    result = Hash.new([])
    res = {}

    arr.each.with_index do |el, i| 
        if result.has_key?(el)
            result[el] << i 
        else
            result[el] = [i]
        end
    end

    res = result.filter do |key, val|
        val.length > 1
    end

    res
end

p dupe_indices(["a", "b", "c", "c", "b"])