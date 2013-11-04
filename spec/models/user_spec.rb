# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  gender                 :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  picture_id             :integer
#

require 'spec_helper'

describe User do
  before(:all) do
  	@user = FactoryGirl.build(:user)
  	@girl = FactoryGirl.build(:girl)
  end

  describe "with valid attributes" do
  	it "should be valid" do
  		@user.should be_valid
  		@girl.should be_valid
  	end
  end
end
