# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :article_tag, dependent: :nullify
  has_many :tags, through: :article_tag

  before_create :identify

  private

    def identify(num = 16)
      self.uuid ||= SecureRandom.hex(num)
    end
end
