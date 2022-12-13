class ArticlePolicy < ApplicationPolicy
    def destroy?
        user.admin? || user.id == record.user_id
    end

    def update?
        user.admin? || user.id == record.user_id
    end

    def edit?
        update?
    end
end