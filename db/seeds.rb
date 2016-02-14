User.create!(name: 'Abhinav Mathur', email: 'raaaaj5000@yahoo.co.in', password: 'password', admin: true)

['Oskar', 'Oscar', 'Patricia', 'Mona', 'Shira', 'Leonardo','Freddy', 'Peter'].each do |name|
  User.create!(name: name, password: 'password', email: "#{name}@yahoo.com")
end
['ruby', 'python','java','c++','exilir','c','erlang','javascript','haskell'].each do |lang|
  Category.create!(name: lang, slug: lang)
end
30.times do
  ran5 = rand(8) + 1
  user = User.find_by_id ran5
  cat = Category.find_by_id ran5
  title = Faker::Book.title
  cat.tutorials.create!(title: title, description: Faker::Hipster.sentence, points_covered: Faker::Hipster.sentence, author: user)
  inn = cat.tutorials.find_by_title(title)
  10.times {
    inn.infos.create!(title: Faker::Book.title, content: Faker::Hipster.paragraph(50))
  }

end