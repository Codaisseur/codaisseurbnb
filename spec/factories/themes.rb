FactoryGirl.define do
  factory :theme do
    name    { Faker::Lorem.sentence(3) }
  end
end
