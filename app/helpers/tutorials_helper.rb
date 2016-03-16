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

module TutorialsHelper
  def has_access?(user, tutorial)
    user.try(:admin) || tutorial.author == user || tutorial.contributors.exists?(member: user, tutorial: tutorial, access: true)
  end

  def list_contributors(contributors, tutorial)
    contributors_list = []
    contributors.each do |contributor|
      contributors_list.push User.find_by_id(contributor.member_id).name
    end
    contributors_list = contributors_list.uniq
    contributors_list.delete(tutorial.author.name)
    contributors_list
  end

  def show_template_name(template,&block)
    block.call if template != nil
  end

  def has_purchased?(tutorial)
    if current_user.purchases.any?
      current_user.purchases.each do |purchase|
        if purchase.tutorial_name == tutorial.title
          return true
        end
      end
    end
    false
  end

end
