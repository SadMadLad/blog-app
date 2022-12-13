class CommentPolicy < ApplicationPolicy
    def update?
        user.admin? || user.id == record.user_id
    end

    def edit?
        update?
    end

    def destroy?
        user.admin? || user.id == record.user_id
    end
end