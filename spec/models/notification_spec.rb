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

require 'spec_helper'

describe Notification do
  pending "add some examples to (or delete) #{__FILE__}"
end
