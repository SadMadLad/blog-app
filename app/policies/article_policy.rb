class ArticlePolicy < ApplicationPolicy
  def destroy?
    permission?
  end

  def update?
    permission?
  end

  def edit?
    permission?
  end

  def show?
    true
  end
end
