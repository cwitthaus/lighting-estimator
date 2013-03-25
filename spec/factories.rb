FactoryGirl.define do

  factory :bulb do
    sequence :lookup_code do |n|
      "Test Bulb#{n}"
    end
    wattage { rand(1..20) }
  end

  factory :estimate do
    user

    factory :estimate_with_replacements do

      ignore do
        replacement_count 4
      end

      after(:create) do |estimate, evaluator|
        FactoryGirl.create_list(
          :replacement,
          evaluator.replacement_count,
          estimate: estimate) 
      end
    end
  end

  factory :replacement do
    estimate
    quantity { rand(1..35) }
    current_bulb_name "Current Bulb"
    current_bulb_wattage { rand(21..50) }
    replacement_bulb_id { FactoryGirl.create(:bulb).id }
  end

  factory :replacement_bulbs do
    replacement
    bulb
  end

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
  end  

end