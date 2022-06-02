class TradesController < ApplicationController
  before_action :set_trade, only: %i[ edit update destroy ]

  # GET /trades or /trades.json
  def index
    @sent_trades = current_user.sent_trades.where(sender_confirmation: true)
    @recieved_trades = current_user.recieved_trades.where(sender_confirmation: true)
  end

  # GET /trades/1 or /trades/1.json
  def show
    @sender = Trade.find(params[:id]).sender
    @recipient = Trade.find(params[:id]).recipient
    @trade = Trade.find(params[:id])
    @trade_item_titles = @trade.trade_items.map { |trade_item| trade_item.manga.title }
  end

  # GET /trades/new
  def new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades or /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully created." }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1 or /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully updated." }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1 or /trades/1.json
  def destroy
    @trade.destroy

    respond_to do |format|
      format.html { redirect_to trades_url, notice: "Trade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm_recipient
    @trade = Trade.find(params[:id])
    @recipient_id = @trade.recipient_id

    if @trade.update(recipient_confirmation: true)
      if @trade.sender_confirmation
        confirm_trade(@trade)
      else
        redirect_to trade_url(@trade), id: @trade.id, notice: "Trade request sent"
      end
    else
      redirect_to trade_url(@trade), notice: "Error while processing trade request"
    end

  end

  def confirm_sender
    @trade = Trade.find(params[:id])
    if @trade.update(sender_confirmation: true)
      redirect_to trade_url(@trade), id: @trade.id, notice: "Trade request sent"
    else
      redirect_to trade_url(@trade), notice: "Error while processing trade request"
    end
  end

  def unconfirm_sender
    @trade = Trade.find(params[:id])
    if @trade.update(sender_confirmation: false)
      redirect_to trade_url(@trade), id: @trade.id, notice: "Trade request cancelled"
    else
      redirect_to trade_url(@trade), notice: "Error while processing trade request"
    end
  end

  def confirm_trade(trade)
    @sender_id = trade.sender.id
    @recipient_id = trade.recipient.id

    trade.transaction do
      begin
        trade.trade_items.each { |item|
          if item.manga.user_id == @recipient_id
            item.manga.update!(user_id: @sender_id)
          else
            item.manga.update!(user_id: @recipient_id)
          end
        }
      rescue
        raise ActiveRecord::Rollback
      end
    end

    if trade.destroy
      redirect_to trades_url, notice: "Trade successfully completed"
    else
      redirect_to trades_url, notice: "Error while processing trade request"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(:sender_id, :recipient_id, :sender_confirmation, :recipient_confirmation)
    end
end
