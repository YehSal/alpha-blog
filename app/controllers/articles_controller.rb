class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'The article has been saved successfully'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'The article has been updated successfully'
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
