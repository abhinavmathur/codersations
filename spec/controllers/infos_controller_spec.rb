# == Schema Information
#
# Table name: infos
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  tutorial_id :integer
#  category_id :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe InfosController, type: :controller do

end
