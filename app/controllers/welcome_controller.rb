class WelcomeController < ApplicationController
  def index
    redirect_to user_path(current_user.slug) if user_signed_in?
  end
end
