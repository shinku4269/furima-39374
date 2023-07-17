FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"testtest567"}
    password_confirmation {password}
    family_name           {person.last.kanji}
    first_name            {person.first.kanji}
    family_name_furigana  {person.last.katakana}
    first_name_furigana   {person.first.katakana}
    birth_day             {Faker::Date.birthday.strftime('%Y-%m-%d')}
  end
end