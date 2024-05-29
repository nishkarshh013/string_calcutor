# string_calculator.rb

class StringCalculator
	def self.add(input)
		return 0 if input.empty?
		negatives = input.scan(/-\d+/).join(" ")
		raise "negatives not allowed: #{negatives}" if input.to_i.negative?
		numbers_array = remove_delimiter(input)
		remove_zero  = remove_zero(numbers_array)
		remove_zero.sum 
	end

	private

	def self.remove_delimiter(input)
		input.tr('^0-9', ' ').strip.split(" ").map(&:to_i)
	end

	def self.remove_zero(numbers_array)
		numbers_array.delete(0)
		return numbers_array
	end
end