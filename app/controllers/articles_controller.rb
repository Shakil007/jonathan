class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_author!, except: [:index, :show]

	def index
		@articles = Article.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@article = current_author.articles.build
	end

	def create
		@article = current_author.articles.build(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def find_article
		@article = Article.find(params[:id])
		
	end

	def article_params
		params.require(:article).permit(:title, :content, :bannerimage)
	end
end
