# == Schema Information
#
# Table name: infopages
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  template_id :integer
#  category_id :integer
#  slug        :string
#

require 'rails_helper'

RSpec.describe Infopage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
