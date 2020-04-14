FactoryBot.define do
  factory :item do
    id                    {"1"}
    name                  {"りんご"}
    price                 {"100"}
    text                  {"りんごです"}
    status                {"新品"}
    delivery_fee          {"出品者負担"}
    from_area             {"東京都"}
    shipping_day           {"2日"}
    user
  end
end
