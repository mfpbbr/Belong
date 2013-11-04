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

class Album < ActiveRecord::Base
	has_many :pictures, as: :imageable
	belongs_to :group
	belongs_to :creator, class_name: "User"
	has_many :notifications, as: :notifiable

	validates :group, presence: true
	validates :creator, presence: true
	validates :name, presence: true
end
