FactoryGirl.define do
  factory :user do
    email 'string@string.com'
    password 'password'
    password_confirmation 'password'
  end
end
