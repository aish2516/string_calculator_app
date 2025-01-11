require 'rails_helper'
require_relative '../../app/models/string_calculator'

Rspec.describe StringCalculator do
	let(:calculator) { StringCalculator.new }


	describe "#add" do
		it "returns 0 for an empty string" do
			expect(calculator.add("")).to eq(0)
		end

		it "returns the number itself for a single number" do
			expect(calculator.add("1")).to eq(1)
			expect(calculator.add("5")).to eq(5)
		end

		it "returns the sum for two numbers separated by a comma" do
			expect(calculator.add("1,2")).to eq(3)
		end

		it "returns the sum for multiple numbers separated by a comma" do
			expect(calculator.add("1,2,3,4")).to eq(10)
		end

		it "handles new lines as delimiters" do
			expect(calculator.add("1\n2,3")).to eq(6)
		end

		it "supports different custom delimiters" do
			expect(calculator.add("//;\\n1;2;3")).to eq(6)
		end

		it "raises an exception for negative numbers" do
			expect(calculator.add("1,-2,3")).to raise_error("negative numbers not allowed -2")
		end

		it "includes all negative numbers in the exception message" do
			expect(calculator.add("1,-2,-3,4")).to raise_error("negative numbers not allowed -2,-3")
		end
	end
end


