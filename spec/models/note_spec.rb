# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  category_id :integer
#  tutorial_id :integer
#  info_id     :integer
#  user_id     :integer
#  title       :string
#  content     :text
#  task        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Note, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
