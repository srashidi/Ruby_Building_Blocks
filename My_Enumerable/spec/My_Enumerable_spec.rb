require 'spec_helper'

describe Enumerable do

	before :each do
		@array = [1,2,3,4]
		@hash = { "Shaunty" => "Hossein", "Justin" => "Sahba", "Royce" => "Nabil" }
	end

	describe "#my_each" do

		context "with array" do

			context "with no block" do
				it "returns nil" do
					expect( @array.my_each ).to be_nil
				end
			end

			context "with block" do

				before do
					@new_array = []
					@array.my_each { |x| @new_array << x + 1 }
				end

				it "acts on each item in the array" do
					expect(@new_array[0]).to eql @array[0] + 1
					expect(@new_array[1]).to eql @array[1] + 1
					expect(@new_array[2]).to eql @array[2] + 1
					expect(@new_array[3]).to eql @array[3] + 1
				end

			end

		end

		context "with hash" do

			context "with no block" do
				it "returns nil" do
					expect( @hash.my_each ).to be_nil
				end
			end

			context "with block" do

				before do
					@new_hash = {}
					@hash.my_each do |key,value|
						key += " blah"
						value += " stuff"
						@new_hash[key] = value
					end
				end

				it "acts on each item's key and value in the hash" do
					expect(@new_hash["Shaunty blah"]).to eql @hash["Shaunty"] + " stuff"
					expect(@new_hash["Justin blah"]).to eql @hash["Justin"] + " stuff"
					expect(@new_hash["Royce blah"]).to eql @hash["Royce"] + " stuff"
				end

			end

		end

	end

	describe "#my_each_with_index" do

		context "with array" do

			context "with no block" do
				it "returns nil" do
					expect( @array.my_each_with_index ).to be_nil
				end
			end

			context "with block" do

				before do
					@new_array = []
					@array.my_each_with_index { |x,index| @new_array << x + index }
				end

				it "acts on each item and its index in the array" do
					expect(@new_array[0]).to eql @array[0] + 0
					expect(@new_array[1]).to eql @array[1] + 1
					expect(@new_array[2]).to eql @array[2] + 2
					expect(@new_array[3]).to eql @array[3] + 3
				end

			end

		end

		context "with hash" do

			context "with no block" do
				it "returns nil" do
					expect( @hash.my_each_with_index ).to be_nil
				end
			end

			context "with block" do

				before do
					@new_hash = {}
					@hash.my_each_with_index do |(key,value),index|
						key = "#{index+1}: " + key
						value += " stuff"
						@new_hash[key] = value
					end
				end

				it "acts on each item's key, value, and index in the hash" do
					expect(@new_hash["1: Shaunty"]).to eql @hash["Shaunty"] + " stuff"
					expect(@new_hash["2: Justin"]).to eql @hash["Justin"] + " stuff"
					expect(@new_hash["3: Royce"]).to eql @hash["Royce"] + " stuff"
				end

			end

		end

	end

	describe "#my_select" do

		context "with array" do

			context "with no block" do
				it "returns nil" do
					expect( @array.my_select ).to be_nil
				end
			end

			context "with block" do

				context "with parameter that includes all items" do
					it "returns the same array" do
						expect( @array.my_select { |x| x < 5 } ).to eql @array
					end
				end

				context "with parameter that includes a few items" do
					it "returns an array with only those few items" do
						expect( @array.my_select { |x| x > 2 } ).to eql [3,4]
					end
				end

				context "with parameter that excludes all items" do
					it "returns an empty array" do
						expect( @array.my_select { |x| x > 5 } ).to eql []
					end
				end

			end

		end

		context "with hash" do

			context "with no block" do
				it "returns nil" do
					expect( @hash.my_select ).to be_nil
				end
			end

			context "with block" do

				context "with parameter that includes all items" do
					it "returns the same hash" do
						expect( @hash.my_select { |a,b| a.length > 4 } ).to eql @hash
					end
				end

				context "with parameter that includes a few items" do
					it "returns an hash with only those few items" do
						expected_hash = { "Shaunty" => "Hossein", "Justin" => "Sahba" }
						expect( @hash.my_select { |a,b| a.include?("u") } ).to eql expected_hash
					end
				end

				context "with parameter that excludes all items" do
					it "returns an empty hash" do
						expected_hash = {}
						expect( @hash.my_select { |a,b| b.include?("x") } ).to eql expected_hash
					end
				end

			end

		end

	end

	describe "#my_all?" do

		context "with array" do

			context "with no block" do

				context "when all items are truthy" do
					it "returns true" do
						expect([4,true,:stuff,"hippo"].my_all?).to be_truthy
					end
				end

				context "when one item is nil" do
					it "returns false" do
						expect([4,true,nil,:stuff,"hippo"].my_all?).to be_falsey
					end
				end

				context "when one item is false" do
					it "returns false" do
						expect([4,true,false,:stuff,"hippo"].my_all?).to be_falsey
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns true" do
						expect( @array.my_all? { |x| x < 5 } ).to be_truthy
					end
				end

				context "when some items don't fall within block parameters" do
					it "returns false" do
						expect( @array.my_all? { |x| x > 2 } ).to be_falsey
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns false" do
						expect( @array.my_all? { |x| x > 5 } ).to be_falsey
					end
				end

			end

		end

		context "with hash" do

			context "with no block" do

				context "when empty" do
					it "returns true" do
						expect({}.my_all?).to be_truthy
					end
				end

				context "with any combination of truthy and falsey keys and values" do
					it "returns true" do
						expect({false => false}.my_all?).to be_truthy
						expect({false => false, nil => nil}.my_all?).to be_truthy
						expect({false => false, nil => nil, true => true}.my_all?).to be_truthy
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns true" do
						expect( @hash.my_all? { |key,value| key.length >= value.length } ).to be_truthy
					end
				end

				context "when some items don't fall within block parameters" do
					it "returns false" do
						expect( @hash.my_all? { |key,value| key.length == value.length } ).to be_falsey
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns false" do
						expect( @hash.my_all? { |key,value| key.length < value.length } ).to be_falsey
					end
				end

			end

		end

	end

	describe "#my_any?" do

		context "with array" do

			context "with no block" do

				context "when all items are truthy" do
					it "returns true" do
						expect([4,true,:stuff,"hippo"].my_any?).to be_truthy
					end
				end

				context "when one item is truthy" do
					it "returns true" do
						expect([4>5,false,nil,"hippo"].my_any?).to be_truthy
					end
				end

				context "when all items are falsey" do
					it "returns false" do
						expect([4>5,false,nil].my_any?).to be_falsey
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns true" do
						expect( @array.my_any? { |x| x < 5 } ).to be_truthy
					end
				end

				context "when only one item falls within block parameters" do
					it "returns true" do
						expect( @array.my_any? { |x| x > 3 } ).to be_truthy
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns false" do
						expect( @array.my_any? { |x| x > 5 } ).to be_falsey
					end
				end

			end

		end

		context "with hash" do

			context "with no block" do

				context "when empty" do
					it "returns false" do
						expect({}.my_any?).to be_falsey
					end
				end

				context "with any combination of truthy and falsey keys and values" do
					it "returns true" do
						expect({false => false}.my_any?).to be_truthy
						expect({false => false, nil => nil}.my_any?).to be_truthy
						expect({false => false, nil => nil, true => true}.my_any?).to be_truthy
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns true" do
						expect( @hash.my_any? { |key,value| key.length >= value.length } ).to be_truthy
					end
				end

				context "when only one item falls within block parameters" do
					it "returns true" do
						expect( @hash.my_any? { |key,value| key.length > value.length } ).to be_truthy
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns false" do
						expect( @hash.my_any? { |key,value| key.length < value.length } ).to be_falsey
					end
				end

			end

		end

	end

	describe "#my_none?" do

		context "with array" do

			context "with no block" do

				context "when all items are truthy" do
					it "returns false" do
						expect([4,true,:stuff,"hippo"].my_none?).to be_falsey
					end
				end

				context "when one item is false" do
					it "returns false" do
						expect([4,true,false,:stuff,"hippo"].my_none?).to be_falsey
					end
				end

				context "when some items are falsey" do
					it "returns false" do
						expect([4,false,nil,:stuff,"hippo"].my_none?).to be_falsey
					end
				end

				context "when all items are falsey" do
					it "returns true" do
						expect([4>5,false,nil].my_none?).to be_truthy
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns false" do
						expect( @array.my_none? { |x| x < 5 } ).to be_falsey
					end
				end

				context "when only one item falls within block parameters" do
					it "returns false" do
						expect( @array.my_none? { |x| x > 3 } ).to be_falsey
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns true" do
						expect( @array.my_none? { |x| x > 5 } ).to be_truthy
					end
				end

			end

		end

		context "with hash" do

			context "with no block" do

				context "when empty" do
					it "returns true" do
						expect({}.my_none?).to be_truthy
					end
				end

				context "with any combination of truthy and falsey keys and values" do
					it "returns false" do
						expect({false => false}.my_none?).to be_falsey
						expect({false => false, nil => nil}.my_none?).to be_falsey
						expect({false => false, nil => nil, true => true}.my_none?).to be_falsey
					end
				end

			end

			context "with block" do

				context "when all items fall within block parameters" do
					it "returns false" do
						expect( @hash.my_none? { |key,value| key.length >= value.length } ).to be_falsey
					end
				end

				context "when only one item falls within block parameters" do
					it "returns false" do
						expect( @hash.my_none? { |key,value| key.length > value.length } ).to be_falsey
					end
				end

				context "when none of the items fall within block parameters" do
					it "returns true" do
						expect( @hash.my_none? { |key,value| key.length < value.length } ).to be_truthy
					end
				end

			end

		end

	end

end