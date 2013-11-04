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

require 'spec_helper'

describe Availability do
  pending "add some examples to (or delete) #{__FILE__}"
end
