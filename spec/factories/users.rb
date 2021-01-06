FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    nickname {"test"}
    last_name {"山田"}
    first_name {"太朗"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth {"2000-01-01"}
  end
end