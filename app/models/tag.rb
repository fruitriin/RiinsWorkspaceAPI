# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :article_tag, dependent: :nullify
  has_many :articles, through: :article_tag
end
