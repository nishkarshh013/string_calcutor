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

		it 'should handle new lines between the data instead of comma' do
			expect(StringCalculator.add("2 \n3, 3, \n3")).to eq(11)
		end

		it "should handle different delimiter	instead of commas" do
			expect(StringCalculator.add("//;\n1;2")).to eq(3)
		end

		it "should handle more delimiter instead of commas" do
			expect(StringCalculator.add("/(?<=2 6[?;.!3\n\ 4/43/|%""':'])\ /")).to eq(58)
		end

		it "should handle more delimiter instead of commas" do
			expect(StringCalculator.add("//;\n1;2")).to eq(3)
		end 

		it "should throw exception 'negatives not allowed' " do
			expect { StringCalculator.add("-3") }.to raise_error("negatives not allowed: -3")
		end

		it "should throw exception 'negatives not allowed' with more than one number " do
			expect { StringCalculator.add("-3 -2 -1 6") }.to raise_error("negatives not allowed: -3 -2 -1")
		end
	end
end