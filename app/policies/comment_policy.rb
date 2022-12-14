class CommentPolicy < ApplicationPolicy
  def update?
    permission?
  end

  def edit?
    permission?
  end

  def destroy?
    permission?
  end
end