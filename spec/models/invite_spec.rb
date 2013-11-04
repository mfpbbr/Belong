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

require 'spec_helper'

describe Invite do
  pending "add some examples to (or delete) #{__FILE__}"
end
