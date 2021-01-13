FactoryBot.define do
  factory :address do
    postal_code        {"123-4567"}
    prefecture_id      {2}
    address            {"横浜市緑区"}
    city               {"青山1-1-1"}
    building_number    {"柳ビル103"}
    phone_number       {"09012345678"}
    association :order
  end
end
