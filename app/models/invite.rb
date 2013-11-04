# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  from_id    :integer
#  to_id      :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Invite < ActiveRecord::Base

	belongs_to :from
	belongs_to :to_id
	belongs_to :group
	validates :from_id, presence: true
	validates :to_id, presence: true
	validates :group_id, presence: true
end
