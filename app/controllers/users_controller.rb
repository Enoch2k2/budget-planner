class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :authorize_user

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def show

    end

    def edit

    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:notice] = @user.errors.full_messages.join("\n")
            redirect_to edit_user_path(@user)
        end
    end

    private
        def authorize_user
            authorize @user
        end

        def user_not_authorized
            flash[:notice] = "You are not authorized to view this page"
            redirect_to user_path(current_user)
        end

        def set_user
            @user = User.find_by_id(params[:id])
        end

        def user_params
            params.require(:user).permit(:email, :first_name, :last_name, :monthly_income)
        end
end
