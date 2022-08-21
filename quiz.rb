
class Quiz
    class << self
        def product(numbers)
            return -1 if (numbers.class != Array && numbers.class != Range)
            numbers.reduce(:*)
        end

        def anagram?(word_1, word_2)
            return false if(word_1.class != String||word_2.class != String)
            order_1 = word_1.downcase.split('').sort.join('')
            order_2 = word_2.downcase.split('').sort.join('')
            order_1 == order_2
        end

        def compare(word_1, word_2)
            word_1.downcase == word_2.downcase
        end

        def order_keys_hash(object)
            keys=object.keys.sort do |a, b|
                a.to_s.length <=> b.to_s.length
            end 
            sorted_keys=keys.map do |key|
                key.to_s
            end
        end

        def reverse_array(array)
            new_array = []
            array.compact!
            index = -1
            while array.size > 0 do
                new_array.push(array.pop)
                index = index - 1
            end
            new_array
        end

        def count_divisors(number)
            range = 1..number
            divisors = range.select { |divisor| number % divisor == 0 }
            valid_divisors = divisors.select { |divisor| divisor % 2 == 0 }
            valid_divisors.size
        end

        def match_parentheses(string)
            chars = string.chars
            open_parentheses = []
            for char in chars do
                if char == ")"
                    if open_parentheses[-1] == "("
                        open_parentheses.pop
                    else
                        return false
                    end
                else
                    open_parentheses.push(char)
                end
            end
            open_parentheses.size == 0
        end
    end
end
