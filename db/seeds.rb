%w[new active unread read].each { |status_name| Status.create!(name: status_name) }
%w[admin user].each { |role_name| Role.create!(name: role_name) }

User.create!(name:  "Egor",
             email: "george.dorosh@mail.ru",
             password:              "foobar",
             password_confirmation: "foobar",
             role_id: 1,
             status_id: 2)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@domain.com"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               status_id: 2)
end

users = User.take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content, created_at: Time.zone.now) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }