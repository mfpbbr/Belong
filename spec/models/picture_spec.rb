# == Schema Information
#
# Table name: pictures
#
#  id                   :integer          not null, primary key
#  imageable_id         :integer
#  imageable_type       :string(255)
#  user_id              :integer
#  text                 :text
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

require 'spec_helper'

describe Picture do
	before(:all) do
		@picture = FactoryGirl.build(:picture)
		@without_text = FactoryGirl.build(:picture, text: nil)
		@without_user = FactoryGirl.build(:picture, user: nil)
	end

  describe "with valid attributes" do
  	it "should be valid" do
  		
  		@picture.should be_valid
  	end

  	it "should increase picture count by 1" do
  		lambda { @picture.save}.should change(Picture, :count).by(1)
  	end

  	context "without text" do
  		it "should not be valid" do
  			@without_text.should be_valid
  		end
  	end

  end

  describe "with invalid attributes" do
  	context "without user" do
  		it "should not be valid" do
  			@without_user.should_not be_valid
  		end
  	end
  end

end
