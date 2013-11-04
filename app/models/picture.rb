# == Schema Information
#
# Table name: pictures
#
#  id                   :integer          not null, primary key
#  imageable_id         :integer
#  imageable_type       :string(255)
#  user_id              :integer
#  text                 :text
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

class Picture < ActiveRecord::Base

	has_attached_file :picture, styles: { thumb: "60*60#", large: "200*200#", medium: "500*500#", large: "1000*1000#" }

	belongs_to :imageable, polymorphic: true
	belongs_to :user
	validates :imageable, presence: true
	validates :user, presence: true
	validates_attachment_presence :picture
end
