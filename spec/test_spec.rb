require_relative '../quiz'

RSpec.describe "Quiz Test" do
	describe "product" do
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
			it "Input: #{numbers}, should be equal: #{result_expected}" do 
				result = Quiz.product numbers
				expect(result_expected).to equal(result)
			end
            
        end
	end

    describe "anagram" do
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

            it "Input: #{params}, sould be equal: #{result_expected}" do
                expect(result_expected).to equal(result) 
            end
        end
    end

    describe "compare" do
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

            it "Input: #{params}, resultado esperado: #{result_expected}, resultado: #{result}" do
                expect(result_expected).to  equal(result)
            end
        end
    end

    describe "order" do 
        input = { abc: 'hello', another_key: 123, 4567 => 'third' }
        result_expected = ["abc", "4567", "another_key"]
        result = Quiz.order_keys_hash(input)
        it "Input: #{input}, should be equal: #{result_expected}" do
            expect(result_expected).to match_array(result)
        end
    end

    describe "reverse_array" do
        cases_array_test = {
            [1, 2, 3] => [3, 2, 1],
            [1, 4, 3, 2] => [2, 3, 4, 1],
        }

        cases_array_test.each do |array, result_expected|
            result = Quiz.reverse_array array
            it "Input: #{result_expected}, should be equal: #{result_expected}" do
                expect(result_expected).to match_array(result)
            end
        end
    end

    describe "dividers" do
         cases_dividers_test = {
            9 => 0,
            12 => 4,
            36 => 6,
            21 => 0,
            2 => 1
        }

        cases_dividers_test.each do |number, result_expected|
            result = Quiz.count_divisors number
            it "Input: #{number}, should be equal: #{result_expected}" do
                expect(result_expected).to equal(result)
            end
        end


    end

    describe "match_parentheses" do 
        cases_match_parentheses_test = {
            '()' => true,
            '(())'=> true,
            ')(' => false,
            '(]' => false,
            '())' => false
        }

        cases_match_parentheses_test.each do |string, result_expected|
            result = Quiz.match_parentheses string
            it "Input: #{string}, should be equal: #{result_expected}" do
                expect(result_expected).to equal(result)
            end
        end
    end
end