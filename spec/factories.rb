FactoryBot.define do
   factory :user do |f|
       f.email {'123@gmail.com'}
       f.password {'123abc'}
   end
end