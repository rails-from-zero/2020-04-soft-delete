FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "John #{i}" }
  end

  factory :post do
    title { "Some name" }
    content { "Some content" }
    user
  end

  factory :comment do
    content { "Some content" }
    post
    user
  end
end
