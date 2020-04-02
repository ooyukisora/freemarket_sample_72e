class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

      validates :nickname, :farst_name, :last_name, :farst_name_kana, 
        :last_name_kana, :birthday, presence: true

      has_one :address

      FactoryBot.define do
        factory :user do
          nickname              {"abe"}
          email                 {"kkk@gmail.com"}
          farst_name              {"山本"}
          last_name               {"隼也"}
          farst_name_kana         {"やまもと"}
          last_name_kana         {"しゅんや"}
          birthday {"1996/12/16"}
          password              {"00000000"}
          password_confirmation {"00000000"}
        end
      end

end
