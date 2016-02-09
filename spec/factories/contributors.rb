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

FactoryGirl.define do
  factory :contributor do
    user nil
tutorial nil
access false
  end

end
