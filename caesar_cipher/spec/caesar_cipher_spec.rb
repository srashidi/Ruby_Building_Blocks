require 'spec_helper'

describe "caesar_cipher method" do
	
	context "with no shift number given" do
		it "outputs the same message" do
			message = caesar_cipher("This is a test, 1... 2... 3...")
			expect(message).to eql "This is a test, 1... 2... 3..."
		end
	end
	
	context "with shift number given" do
		context "with lowercase letters" do
			it "shifts each letter by the given number" do
				message = caesar_cipher("this is a test",5)
				expect(message).to eql "ymnx nx f yjxy"
			end
		end
		context "with uppercase letters" do
			it "shifts each letter by the given number" do
				message = caesar_cipher("THIS IS A TEST",5)
				expect(message).to eql "YMNX NX F YJXY"
			end
		end
		context "with a string of numbers" do
			it "shifts each number by the given number" do
				message = caesar_cipher("12345",5)
				expect(message).to eql "67890"
			end
		end
		context "with punctuation" do
			it "just shifts letters and numbers and maintains punctuation" do
				message = caesar_cipher("This is a test, 1... 2... 3...",5)
				expect(message).to eql "Ymnx nx f yjxy, 6... 7... 8..."
			end
		end
	end
	
end