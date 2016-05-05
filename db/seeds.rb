100.times do
  user = User.create!(email: Faker::Internet.email, password: 'password',
              password_confirmation: 'password')
  topic = Topic.create!(name: Faker::Company.name, user_id: user)
  Post.create!(title: Faker::Company.name, content: Faker::Lorem.paragraph,
               user: user, topic: topic)
end
