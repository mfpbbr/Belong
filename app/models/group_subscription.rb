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

class GroupSubscription < ActiveRecord::Base

	belongs_to :user
	belongs_to :group

	validates :user, presence: true
	validates :group, presence: true
end
