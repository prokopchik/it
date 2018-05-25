class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    authorize @article, :show?
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.articles.new(article_params)
    authorize @article, :create?

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @article, :update?

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @article, :destroy?
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
