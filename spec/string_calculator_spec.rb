# string_calculator_spec.rb

require 'rspec'
require_relative '../string_calculator'
RSpec.describe StringCalculator do
	describe '.add' do
		it 'should return 0 for any empty string' do
			expect(StringCalculator.add("")).to eq(0)
		end

		it 'should return the addition of single number' do
			expect(StringCalculator.add('3')).to eq(3)
		end

		it 'should return the addition of any amounts of number' do
			expect(StringCalculator.add("2,3,4, 5,6")).to eq(20)
		end
	end
end