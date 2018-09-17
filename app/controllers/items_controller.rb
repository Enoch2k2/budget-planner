class ItemsController < ApplicationController
    before_action :set_user
    before_action :set_budget
    before_action :set_item, only: [:edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index

    end

    def new
        @item = @budget.items.build
        authorize @item.tap{|item| item.budgets << @budget}
    end

    def create
        @item = @budget.items.build(item_params)
        authorize @item.tap{|item| item.budgets << @budget}
        if @item.save
            flash[:notice] = "#{@item.name} was successfully created"
            redirect_to user_budget_path(@user, @budget)
        else
            flash[:danger] = "Please fill out all required fields"
            redirect_to new_user_budget_item(@user, @budget)
        end
    end

    def edit
    end

    def update
        if @item.update(item_params)
            flash[:notice] = "#{@item.name} successfully updated"
            redirect_to user_budget_path(@user, @budget)
        else
            flash[:danger] = "Please fill out all required fields"
            redirect_to edit_user_budget_item_path(@user, @budget, @item)
        end
    end

    def destroy
        BudgetItem.find_by(budget: @budget, item: @item).destroy
        flash[:notice] = "#{@item.name} successfully deleted"
        redirect_to user_budget_path(@user, @budget)
    end

    private
        def authorize_user
            authorize @item
        end

        def user_not_authorized
            flash[:notice] = "You are not authorized to view this page"
            redirect_to user_path(current_user)
        end

        def set_user
            @user = User.find_by_id(params[:user_id])
        end

        def set_budget
            @budget = Budget.find_by_id(params[:budget_id])
        end

        def set_item
            @item = Item.find_by_id(params[:id])
        end

        def item_params
            params.require(:item).permit(:name, :cost, :category_id)
        end
end
