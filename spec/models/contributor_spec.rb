# == Schema Information
#
# Table name: contributors
#
#  id          :integer          not null, primary key
#  tutorial_id :integer
#  access      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :integer
#

require 'rails_helper'

RSpec.describe Contributor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
