# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  text       :text
#  picture_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Post do
	before(:all) do
		@post = FactoryGirl.build(:post)
		@without_text = FactoryGirl.build(:post, text: nil)
		@without_group = FactoryGirl.build(:post, group: nil)
		@without_user = FactoryGirl.build(:post, user: nil)
		@without_picture = FactoryGirl.build(:post, picture: nil)
	end


  describe "with valid attributes" do
  	it "should be valid" do
  		@post.should be_valid
  	end

  	context "without_picture" do
  		it "should not e valid" do
  			@without_picture.should be_valid
  		end
  	end
  end

  describe "with invalid attributes" do
  	context "without text" do
  		it "should not be valid" do
  			@without_text.should_not be_valid
  		end
  	end

  	context "without group" do
  		it "should not be valid" do
  			@without_group.should_not be_valid
  		end
  	end

  	context "without user" do
  		it "should not be valid" do
  			@without_user.should_not be_valid
  		end
  	end


  end
end
