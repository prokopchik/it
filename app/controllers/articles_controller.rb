class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    if params[:query]
      @articles = Article.search { fulltext params[:query] }.results
    else
      @articles = Article.all.order(created_at: :desc)
    end
  rescue RSolr::Error::ConnectionRefused
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    authorize @article, :show?
    @comments = @article.comments.root.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def edit
  end

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
    params.require(:article).permit(:title, :body, :short_description)
  end
end
