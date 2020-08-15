# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    articles = Article.order(created_at: :desc).limit(10)
    render json: articles_render(articles)
  end

  private

    def articles_render(articles)
      articles.map { |a| article_render(a) }
    end

    def article_render(article)
      {
        id: article.id,
        uuid: article.uuid,
        title: article.title,
        body: article.body.html_safe,
        tags: article.tags.map { |t| t.name },
        created_at: article.created_at,
        updated_at: article.updated_at
      }
    end
end
