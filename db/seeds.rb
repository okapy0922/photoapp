10.times do |n| # 10人分の架空のアカウントデータ投入
  email = Faker::Internet.email
  password = "password"
  user = User.create!(email: email,
    password: password,
    password_confirmation: password,
    uid: "1234567#{n}",
    provider: "",
  )
  5.times do |n| # 5件分まとめて投稿
    Photo.create!(
      img: (open("#{Rails.root}/app/assets/images/selfyogre.png")),
      content: "test",
      user_id: user.id,
    )
  end
end
