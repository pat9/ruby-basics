
class Quiz
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

end
