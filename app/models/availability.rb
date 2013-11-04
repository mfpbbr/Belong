# == Schema Information
#
# Table name: availabilities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  from       :datetime
#  to         :datetime
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#

class Availability < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :notifications, as: :notifiable
	validates :user_id, presence: true
	validates :group_id, presence: true
	validates :from, presence: true
	validates :to, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
end
