class ArticlePolicy < ApplicationPolicy
    def destroy?
        user.admin? || user.id == record.user_id
    end
end