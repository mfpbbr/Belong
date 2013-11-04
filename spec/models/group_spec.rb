# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  capacity   :integer
#  creator_id :integer
#  picture_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Group do
	before(:all) do
		@group = FactoryGirl.build(:group)
	end

  describe "with valid attributes" do
  	it "should be valid" do
  		@group.should be_valid
  	end
  end
  describe "with invalid attributes" do
  	context "without a creator" do
  		before(:all) do
  			@without_creator = FactoryGirl.build(:group, creator: nil)
  		end
  		it "should not be valid" do
  			@without_creator.should_not be_valid
  		end
  	end

  	context "without capacity" do
  		before(:all) do
  			@without_capacity = FactoryGirl.build(:group, capacity: nil)
  		end
  		it "should not be valid" do
  			@without_capacity.should_not be_valid
  		end
  	end

  	context "without name" do
  		before(:all) do
  			@without_name = FactoryGirl.build(:group, name: nil)
  		end
  		it "should not be valid" do
  			@without_name.should_not be_valid
  		end
  	end
  end
end
