module Creators::DashboardHelper

  def authors_with_category(category)
    arr = []
    category.tutorials.includes(:author).each do |tutorial|
      arr.push(tutorial.author.id)
    end
    arr.uniq.count
  end

  def total_contributors_count_in_category(category)
    count = 0
    category.tutorials.each do |tutorial|
      count = count + tutorial.contributors.count
    end
    count
  end

  def total_snippet_count_in_category_unpublished(category)
    count = 0
    category.snippets.each do |snippet|
      unless snippet.publish?
        count = count + 1
      end
    end
    count
  end

  def total_snippet_count_in_category_published(category)
    count = 0
    category.snippets.each do |snippet|
      if snippet.publish?
        count = count + 1
      end
    end
    count
  end
end
