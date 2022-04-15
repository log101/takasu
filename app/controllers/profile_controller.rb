class ProfileController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      render "show_signed_in"
    end
  end
end
