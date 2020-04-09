FactoryBot.define do
  factory :image do
    id           {"1"}
    img        {File.open("public/uploads/image/img/26/49859079.png")}
    item        
  end
end
