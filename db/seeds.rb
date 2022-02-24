user = User.create!(confirmed_at: DateTime.now
                    email: FFaker::Internet.email,
                    name: FFaker::Name.name,
                    password: FFaker::Internet.password)

puts "#############################################
      USER #{user.id} created in #{Rails.env} env:
      EMAIL #{user.email}
      PASSWORD #{user.password}
      #############################################"

10.times do
  Post.create({
    content: FFaker::Book.description[0..255],
    user: user
  })
end
