# == Schema Information
#
# Table name: tutorials
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  title             :string
#  description       :text
#  points_covered    :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  link_to_repo      :string
#  slug              :string
#  author_id         :integer
#  publish           :boolean          default(FALSE)
#  template_id       :integer
#  impressions_count :integer          default(0)
#

require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do

end
