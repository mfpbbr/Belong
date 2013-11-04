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

class Post < ActiveRecord::Base
	has_one :picture, as: :imageable
	belongs_to :user
	belongs_to :group
	validates :group, presence: true
	validates :user, presence: true
	validates :text, presence: true
end
