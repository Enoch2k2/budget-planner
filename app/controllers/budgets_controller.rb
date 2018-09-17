class BudgetsController < ApplicationController
    before_action :set_user
    before_action :set_budget, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user, only: [:show, :edit, :update, :destroy]
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
        @budgets = @user.budgets
        authorize (@budgets.first || @user.budgets.build)
        @budgets = @budgets.select{|budget| budget if budget.id}
    end

    def new
        @budget = @user.budgets.build
    end

    def create
        @budget = Budget.new(budget_params)
        authorize @budget
        if @budget.save
            flash[:notice] = "#{@budget.title} has been created"
            redirect_to user_budgets_path(@user)
        else
            flash[:danger] = "Must have a title"
            redirect_to new_user_budget_path(@user)
        end
    end

    def show

    end

    def edit

    end

    def update
        if @budget.update(budget_params)
            flash[:notice] = "#{@budget.title} has been updated"
            redirect_to user_budgets_path(@user)
        else
            flash[:danger] = "Fill out all of the required fields"
            redirect_to edit_user_budget_path(@user, @budget)
        end
    end

    def destroy
        @budget.destroy
        flash[:notice] = "#{@budget.title} has been successfully deleted"
        redirect_to user_budgets_path(@user)
    end

    private
        def authorize_user
            authorize @budget
        end

        def user_not_authorized
            flash[:notice] = "You are not authorized to view this page"
            redirect_to user_path(current_user)
        end

        def set_user
            @user = User.find_by_id(params[:user_id])
        end

        def set_budget
            @budget = Budget.find_by_id(params[:id])
        end

        def budget_params
            params.require(:budget).permit(:title, :monthly_income, :user_id)
        end
end
