require 'spec_helper'

describe "my_select method" do
	
	context "with array" do
	
		before :each do
			@array = [1,2,3,4]
		end
		
		context "with no block" do
			it "returns nil" do
				expect( @array.my_select ).to eql nil
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
		
		before :each do
			@hash = { "Shaunty" => "Hossein", "Justin" => "Sahba", "Royce" => "Nabil" }
		end
		
		context "with no block" do
			it "returns nil" do
				expect( @hash.my_select ).to eql nil
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