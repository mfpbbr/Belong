# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  notifiable_id   :integer
#  notifiable_type :string(255)
#  source_id       :integer
#  type            :string(255)
#  summary         :text
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Notification < ActiveRecord::Base
	belongs_to :notifiable, polymorphic: true
	belongs_to :source

	validates :notifiable_type, presence: true
	validates :notifiable_id, presence: true
	validates :type, presence: true
	validates :summary, presence: true
	validates :source_id, presence: true
end
