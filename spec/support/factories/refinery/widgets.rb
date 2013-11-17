
FactoryGirl.define do
  factory :widget, :class => Refinery::Widgets::Widget do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

