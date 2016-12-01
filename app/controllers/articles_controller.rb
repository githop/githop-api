class ArticlesController < ApplicationController
  def index
    # article = Article.includes(:images, :headers, :paragraphs)
    # render json: article.as_json(include: [:images, :headers, :paragraphs])
    render json: Article.documents
  end

  def show
    render json: Article.find(params[:id]).document
  end
end
