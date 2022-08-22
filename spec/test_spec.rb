require_relative '../quiz'

RSpec.describe "Quiz Test" do
	quiz = Quiz.new
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
				result = quiz.product numbers
				expect(result_expected).to equal(result)
			end
            
        end
	end
end