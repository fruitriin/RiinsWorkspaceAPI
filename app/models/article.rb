# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :tag, through: :article_tags
end
