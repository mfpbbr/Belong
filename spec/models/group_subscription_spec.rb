# == Schema Information
#
# Table name: group_subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe GroupSubscription do
  before(:all) do
  	@gs = FactoryGirl.build(:group_subscription)
  	@without_user = FactoryGirl.build(:group_subscription, user: nil)
  	@without_group = FactoryGirl.build(:group_subscription, group: nil)
  end

  describe "with valid attributes" do
  	it "should be valid" do
  		@gs.should be_valid
  	end
  end

  describe "with invalid attributes" do
  	context "without user" do
  		it "should not be valid" do
  			@without_user.should_not be_valid
  		end
  	end

  	context "without group" do
  		it "should not be valid" do
  			@without_group.should_not be_valid
  		end
  	end
  end
end
