# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  creator_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Album do
	before(:all) do
		@valid_album = FactoryGirl.build(:album)
		@without_name = FactoryGirl.build(:album, name: nil)
  	@with_empty_name = FactoryGirl.build(:album, name: "")
  	@without_group = FactoryGirl.build(:album, group: nil)
  	@without_creator = FactoryGirl.build(:album, creator: nil)
	end
  describe "with valid attributes" do
  	it "should be valid" do
  		@valid_album.should be_valid
  	end
  	it "should increase album count by 1" do
  		lambda { @valid_album.save }.should change(Album, :count).by(1)
  	end
  end

  describe "without valid attributes" do
  	context "without a name" do
  		it "should not be valid" do
  			@without_name.should_not be_valid
  			@with_empty_name.should_not be_valid
  		end
  	end

  	context "without a group" do
  		it "should not be valid" do
  			@without_group.should_not be_valid
  		end
  	end

  	context "without a creator" do
  		it "should not be valid" do
  			@without_creator.should_not be_valid
  		end
  	end
  end
end
