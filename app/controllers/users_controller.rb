class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit]
    
    def show

    end

    def edit

    end

    def update

    end

    private
        def set_user
            binding.pry
            @user = User.find_by_slug(params[:slug])
        end
end
