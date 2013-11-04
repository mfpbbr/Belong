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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include TokenAuthenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :pictures, as: :imageable
  has_many :group_subscriptions
  has_many :groups, through: :group_subscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  def self.find_for_facebook_auth(auth, signed_in_resource=nil)
  	user = User.find_by(provider: auth.provider, uid: auth.uid) || User.find_by(email: auth.info.email)
  	if user
  		user.update_attributes(provider: auth.provider, uid: auth.uid)
  	else
  		user = User.new_with_auth(auth)
  	end
    user
  end

  def self.new_with_auth(auth)
  	user = User.new(first_name: auth.extra.raw_info.first_name, last_name: auth.extra.raw_info.last_name, provider: auth.provider, uid: auth.uid, email: auth.info.email)
  end

  def name
    self.first_name + " " + self.last_name
  end
end
