class HomeController < ApplicationController
  def index
    Trade.where(sender_confirmation: false).destroy_all
    @sent_trades = current_user.sent_trades.where(sender_confirmation: true)
    @recieved_trades = current_user.recieved_trades.where(sender_confirmation: true)
    @total_number_of_trades = @sent_trades.length + @recieved_trades.length
  end
end
