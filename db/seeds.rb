#User.create!(name: 'Abhinav Mathur', email: 'raaaaj5000@yahoo.co.in', password: 'password', admin: true)
ran5 = rand(4) + 1

30.times do |t|
  ran5 = rand(4) + 1
  user = User.find_by_id ran5
  cat = Category.find_by_id ran5
  title = Faker::Book.title
  cat.tutorials.create!(title: title, description: Faker::Hipster.sentence, points_covered: Faker::Hipster.sentence, author: user)
  inn = cat.tutorials.find_by_title(title)
  10.times {
    inn.infos.create!(title: Faker::Book.title, content: Faker::Hipster.paragraph(10))
  }

end