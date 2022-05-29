class HomeController < ApplicationController
  def index
    @sent_trades = Trade.where(sender_id: current_user.id, sender_confirmation: true)
    @recieved_trades = Trade.where(recipient_id: current_user.id, sender_confirmation: true)
    @total_number_of_trades = @sent_trades.length + @recieved_trades.length
  end
end
