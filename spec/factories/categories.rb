=begin
FactoryBot.define do
  factory :category do |f|
    name "sales"
    association :user, factory: :post, strategy: :build_stubbed
    display true

    trait :display do
      display true
    end

    trait :no_display do
      display false
    end

  end
end
=end