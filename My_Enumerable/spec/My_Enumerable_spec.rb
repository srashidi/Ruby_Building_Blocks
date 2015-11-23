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
			end

		end

		context "with hash" do

			context "with no block" do
				it "returns nil" do
					expect( @hash.my_each ).to be_nil
				end
			end

			context "with block" do
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
			end

		end

		context "with hash" do

			context "with no block" do
				it "returns nil" do
					expect( @hash.my_each_with_index ).to be_nil
				end
			end

			context "with block" do
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
			end

			context "with block" do
			end

		end

		context "with hash" do

			context "with no block" do
			end

			context "with block" do
			end

		end

	end

	describe "#my_any?" do

		context "with array" do

			context "with no block" do
			end

			context "with block" do
			end

		end

		context "with hash" do

			context "with no block" do
			end

			context "with block" do
			end

		end

	end

	describe "#my_none?" do

		context "with array" do

			context "with no block" do
			end

			context "with block" do
			end

		end

		context "with hash" do

			context "with no block" do
			end

			context "with block" do
			end

		end

	end

end