class CategoryPolicy < ApplicationPolicy
    def index?
      user == record.budgets.first.user
    end

    def show?
        user == record.budgets.first.user
    end
  
    def update?
        user == record.budgets.first.user
    end

    def destroy?
        user == record.budgets.first.user
    end
  
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end