FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '08251023Jke01' }
    password_confirmation { password }
    last_name             { '吉田' }
    first_name            { '二郎' }
    last_name_kana        { 'ヨシダ' }
    first_name_kana       { 'ジロウ' }
    birth_date            { '1930-01-01' }
  end
end
