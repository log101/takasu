class ProfileController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @trade = Trade.find_or_create_by(sender_id: current_user.id, recipient_id: @user.id, sender_confirmation: false, recipient_confirmation: false)
    if @user == current_user
      render "show_signed_in"
    end
  end
end
