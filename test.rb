require_relative 'quiz'
require 'minitest/autorun'

class QuizTest < Minitest::Test

    

    def setup
        @quiz = Quiz.new
    end

    def test_product?
        cases_product_test = {
            [1, 4, 21] => 84,
            [-4, 2.3e12, 77.23, 982, 0b101] => -3.48863356e+18,
            [-3, 11, 2] => -66,
            [8, 300] => 2400,
            [234, 121, 23, 945, 0] => 0,
            1..5 => 120,
            "hello" => -1
        } 
        cases_product_test.each do |numbers, result_expected|
            result = @quiz.product numbers
            puts "Input: #{numbers}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

    def test_anagram?
         cases_anagram_test = {
            ['Tap', 'paT'] => true,
            ['beat', 'table'] => false,
            ['beat', 'abet'] => true,
            ['seat', 'teal'] => false,
            ['god', 'Dog'] => true,
        } 
        cases_anagram_test.each do |params, result_expected|
            word_1 = params[0]
            word_2 = params[1]

            result = @quiz.anagram? word_1, word_2
            
            puts "Input: #{params}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

end