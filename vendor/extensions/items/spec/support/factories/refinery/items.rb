
FactoryGirl.define do
  factory :item, :class => Refinery::Items::Item do
    sequence(:nombre) { |n| "refinery#{n}" }
  end
end

