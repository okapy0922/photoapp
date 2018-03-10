10.times do |n|
  email = Faker::Internet.email
  password = "password"
  user = User.create!(email: email,
               password: password,
               password_confirmation: password,
               uid: "1234567#{n}",
               provider: "",
               )
   5.times do |n|
     Photo.create!(
                      img: (open("#{Rails.root}/app/assets/images/selfyogre.png")),
                      content: "test",
                      user_id: user.id,
                      )
   end
end
