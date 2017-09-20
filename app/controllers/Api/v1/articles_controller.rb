module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: { status: 'SUCCESS', message: 'Loaded articles', data:articles }, status: :ok
      end

      def show
        articles = Article.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded articles', data:articles }, status: :ok
      end

      def create
        articles = Article.new(article_params)
          if article.save
            render json: { status: 'SUCCESS', message: 'Article saved', data:articles }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Article not save', data:articles.errors }, status: :unprocessable_entity
      end

      private
        def article_params
          params.permit(:title,:body)
        end
      end
    end
  end
end
