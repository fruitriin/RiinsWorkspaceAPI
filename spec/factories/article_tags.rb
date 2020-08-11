# frozen_string_literal: true

FactoryBot.define do
  factory :article_tag do
    article { nil }
    tag { nil }
  end
end
