class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      render "show_signed_in"
    else
      @trade = Trade.find_or_create_by(sender_id: current_user.id, recipient_id: @user.id)
    end
  end
end
