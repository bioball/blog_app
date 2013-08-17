FactoryGirl.define do 
  factory :user do
    name      "Michael Jordan"
    email     "michael@jordan.com"
    password  "mj23izthebest"
    password_confirmation "mj23izthebest"
  end
  factory :blog do
    title     "Lorem ipsum"
    content   "iz the best"
  end
end