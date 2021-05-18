# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length < 1

        sorted = self.sort 

        sorted[-1] - sorted[0]
    end

    def average
        return nil if self.length < 1

        sum = self.reduce { |num, acc| num + acc }

        sum / self.length.to_f
    end

    def median 
        return nil if self.length < 1

        sorted = self.sort

        return sorted[sorted.length / 2] if sorted.length % 2 != 0

        (sorted[sorted.length / 2] + sorted[sorted.length / 2 - 1]) / 2.0
    end

    def counts
        result = Hash.new(0)

        self.each { |el| result[el] += 1 }

        result
    end

    def my_count(el)
        counts[el]
    end

    def my_index(val)
        self.each.with_index { |el, i| return i if el === val }

        nil
    end

    def my_uniq
        result = []

        self.each { |el| result << el if !result.include?(el) }

        result    
    end

    def my_transpose
        res = []
        
        i = 0
        j = 0

        for ar in self do
            newRow = []
            j = 0
            for el in ar do
                newRow << self[j][i]
                j += 1
            end
            res << newRow
            i += 1
        end

        res
    end
end
