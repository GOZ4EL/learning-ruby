def reverser(string, &block)
    block.call(string.split.join.reverse())
end

def word_changer(string, &block)
    res = []

    string.split(' ').each { |word| res << block.call(word)}

    res.join(' ')
end

def greater_proc_value(num, proc1, proc2)
    val1 = proc1.call(num)
    val2 = proc2.call(num)

    val1 > val2 ? val1 : val2
end

def and_selector(arr, proc1, proc2)
    res = []    
    
    arr.each { |el|res << el if proc1.call(el) && proc2.call(el) }

    res
end

def alternating_mapper(arr, proc1, proc2)
    res = []

    arr.each.with_index do |el, i|
        if i % 2 === 0
            res << proc1.call(el)
        else
            res << proc2.call(el)
        end
    end

    res
end