class Api::ArticlesController < ApplicationController
  def index
    article = Article.order(created_at: :desc)
    render json: { data: article }
  end
end
