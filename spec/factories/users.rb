FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {"test"}
    last_name {"山田"}
    first_name {"太朗"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth {"2000-01-01"}
  end
end



# nickname {Faker::Nickname.name}
#     last_name {Faker::Name.last_name}
#     first_name {Faker::Name.first_name}
#     last_name_kana {Faker::Name.last.katakana}
#     first_name_name {Faker::Name.first.katakana}
#     barth {Faker::Barth.barth}