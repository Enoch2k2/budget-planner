class ItemPolicy < ApplicationPolicy
    def index?
      user == record.budgets.find_by(user: user).user
    end
    
    def create?
        record.budgets.find{|budget| budget.user == user} ? true : false
    end

    def show?
        record.budgets.find{|budget| budget.user == user} ? true : false
    end
  
    def update?
        record.budgets.find{|budget| budget.user == user} ? true : false
    end

    def destroy?
        record.budgets.find{|budget| budget.user == user} ? true : false
    end
  
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end