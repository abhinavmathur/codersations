json.array! @all do |all|
  json.class_name all.class.name
  if all.class.name == 'Category' || all.class.name == 'Template' || all.class.name == 'User'
    json.title all.name
  else
    json.title all.title
  end
  if all.class.name == 'Category'
    json.url category_path(all)
  elsif all.class.name == 'Tutorial'
    json.url  category_tutorial_path(all.category, all)
  elsif all.class.name == 'Template'
    json.url  category_template_path(all.category, all)
  elsif all.class.name == 'Info'
    json.url  category_tutorial_info_path(all.tutorial.category, all.tutorial, all )
  elsif all.class.name == 'InfoPage'
    json.url  category_template_path(all.template.category, all.template, all)
  elsif all.class.name == 'User'
    json.url  user_path(all)
  end
end
