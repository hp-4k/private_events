FactoryGirl.define do
  
  factory :user do
    name "Foobar"
    password "barbaz"
    password_confirmation "barbaz"
  end
  
  factory :invalid_user, parent: :user do
    name ''
  end

end
