FactoryBot.define do
  factory :user do
    name                     { '山田太郎' }
    email                    { Faker::Internet.free_email }
    password                 { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    mission                  { 'エンジニア転職を成功させる' }
  end
end