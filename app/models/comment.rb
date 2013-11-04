# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  text             :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, polymorphic: true

	validates :user_id, presence: true
	validates :commentable_id, presence: true
	validates :commentable_type, presence: true
	validates :text, presence: true
end
