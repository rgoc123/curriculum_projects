
FactoryBot.define do
  factory :user do
    username { Faker::StarTrek.character }
    password { Faker::Internet.password(6)} 
    
    factory :invalid_user do 
      password 'nope'
    end 
    
    factory :auth_user do 
      username 'Godzilla'
      password 'password'
    end
  end  
end
