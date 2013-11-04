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

class Group < ActiveRecord::Base
	has_many :pictures, as: :imageable
	has_many :group_subscriptions
	has_many :users, through: :group_subscriptions
	belongs_to :creator, class_name: "User"
	validates :name, presence: true
	validates :capacity, presence: true
	validates :creator, presence: true
end
