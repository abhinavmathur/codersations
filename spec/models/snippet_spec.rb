# == Schema Information
#
# Table name: snippets
#
#  id          :integer          not null, primary key
#  category_id :integer
#  title       :string
#  content     :text
#  featured    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  publish     :boolean          default("false")
#  slug        :string
#  template_id :integer
#  tutorial_id :integer
#

require 'rails_helper'

RSpec.describe Snippet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
