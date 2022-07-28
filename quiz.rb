
class Quiz
    def product(numbers)
        return 0 if (numbers.class != Array && numbers.class != Range)
        numbers.reduce(:*)
    end

    def p
    end
end