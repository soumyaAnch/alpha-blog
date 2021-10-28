class ArticlesController < ApplicationController
    before_action :find_article ,only: [:edit, :update, :show, :destory]

    def show
    end

    def index
        @articles=Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(set_article)
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article 
        else
            render 'new'
        end
    end

    def update
        if @article.update(set_article)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def find_article
        @article = Article.find(params[:id])
    end

    def set_article
        params.require(:article).permit(:title, :description)
    end
    
end
