# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :article_tag, dependent: :nullify
  has_many :tags, through: :article_tag
end
