require_relative 'quiz'
require 'minitest/autorun'

class QuizTest < Minitest::Test

    
    def test_product?
         puts "\n\n\n"
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
            result = Quiz.product numbers
            puts "Input: #{numbers}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

    def test_anagram?
         puts "\n\n\n"
         cases_anagram_test = {
            ['Tap', 'paT'] => true,
            ['beat', 'table'] => false,
            ['beat', 'abet'] => true,
            ['seat', 'teal'] => false,
            ['god', 'Dog'] => true,
            ['god', 1] => false,
        } 
        cases_anagram_test.each do |params, result_expected|
            word_1 = params[0]
            word_2 = params[1]

            result = Quiz.anagram? word_1, word_2

            puts "Input: #{params}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

    def test_compare?
        puts "\n\n\n"
        cases_compare_test = {
            ['nice', 'nice'] => true,
            ['how', 'who'] => false,
            ['GoOd DaY', 'gOOd dAy'] => true,
            ['foo', 'food'] => false
        }

        cases_compare_test.each do |params, result_expected|
            word_1 = params[0]
            word_2 = params[1]

            result = Quiz.compare word_1, word_2

            puts "Input: #{params}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
        
    end

    def test_order
        input = { abc: 'hello', another_key: 123, 4567 => 'third' }
        result_expected = ["abc", "4567", "another_key"]
        result = Quiz.order_keys_hash(input)
        puts "Input: #{input}, resultado esperado: #{result_expected}, resultado: #{result}"
        assert_equal result_expected, result
    end

    def test_reverse_array
        puts "\n\n\n"
        cases_array_test = {
            [1, 2, 3] => [3, 2, 1],
            [1, 4, 3, 2] => [2, 3, 4, 1],
        }

        cases_array_test.each do |array, result_expected|
            result = Quiz.reverse_array array
            puts "Input: #{result_expected}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

    def test_dividers
        puts "\n\n\n"
        cases_dividers_test = {
            9 => 0,
            12 => 4,
            36 => 6,
            21 => 0,
            2 => 1
        }

        cases_dividers_test.each do |number, result_expected|
            result = Quiz.count_divisors number
            puts "Input: #{number}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
    end

    def test_match_parentheses
        puts "\n\n\n"
        cases_match_parentheses_test = {
            '()' => true,
            '(())'=> true,
            ')(' => false,
            '(]' => false,
            '())' => false
        }

        cases_match_parentheses_test.each do |string, result_expected|
            result = Quiz.match_parentheses string
            puts "Input: #{string}, resultado esperado: #{result_expected}, resultado: #{result}"
            assert_equal result_expected, result
        end
        
    end
    

end