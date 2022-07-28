
class Quiz
    def product(numbers)
        return -1 if (numbers.class != Array && numbers.class != Range)
        numbers.reduce(:*)
    end

    def anagram?(word_1, word_2)
       order_1 = word_1.downcase.split('').sort.join('')
       order_2 = word_2.downcase.split('').sort.join('')
       order_1 == order_2
    end
end
