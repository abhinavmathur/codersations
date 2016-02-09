# == Schema Information
#
# Table name: tutorials
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  title          :string
#  description    :text
#  points_covered :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  link_to_repo   :string
#  slug           :string
#  author_id      :integer
#

module TutorialsHelper
  def has_access?(user, tutorial)
    user.admin || tutorial.author == user || tutorial.contributors.exists?(member: user, tutorial: tutorial, access: true)
  end
end