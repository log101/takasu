class TradesController < ApplicationController
  before_action :set_trade, only: %i[ edit update destroy ]

  # GET /trades or /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1 or /trades/1.json
  def show
    @sender = current_user
    @recipient = Trade.find(params[:id]).recipient
    @trade = Trade.find(params[:id])
  end

  # GET /trades/new
  def new
    @trade = Trade.find_or_create_by(sender_id: current_user.id, recipient_id: params[:recipient_id], confirmed: false)
    @sender = current_user
    @recipient = User.find(params[:recipient_id])
    render 'show'
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

  def add_trade_item
    @trade = Trade.find(trade_item_params[:trade_id])
    @trade_item = TradeItem.new(manga_id: trade_item_params[:manga_id], trade_id: @trade.id)

    #create(manga_id: params[:manga_id], trade_id: params[:trade_id])
    if @trade_item.save
      puts "HEYYYYYYY: " + @trade_item.trade.recipient.id.to_s
      redirect_to trade_url(@trade), id: @trade_item.trade.recipient.id
    else
      redirect_to trade_url(@trade), notice: "Error while adding trade item"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(:sender_id, :recipient_id, :confirmed)
    end

    def trade_item_params
      params.permit(:manga_id, :trade_id)
    end
end
