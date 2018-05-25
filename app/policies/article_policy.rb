class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && (user.writer? || user.admin?)
  end

  def update?
    user.present? && (user == article.user || user.admin?)
  end

  def destroy?
    user.present? && (user == article.user || user.admin?)
  end

  private

  def article
    record
  end
end
