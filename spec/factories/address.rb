FactoryBot.define do
  factory :address do
    first_name              {"山本"}
    last_name               {"隼也"}
    first_name_kana         {"やまもと"}
    last_name_kana         {"しゅんや"}
    postal    {12345}
    prefecture  {"京都"}
    municipality {"京都市北区"}
    address　{"31"}
  end
end