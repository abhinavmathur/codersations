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
#

require 'rails_helper'

RSpec.describe InfopagesController, type: :controller do

end
