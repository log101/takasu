class MangasController < ApplicationController
  before_action :set_manga, only: %i[ show edit update destroy ]


  # GET /mangas or /mangas.json
  def index
    @mangas = Manga.where(user_id: current_user.id)
  end

  # GET /mangas/1 or /mangas/1.json
  def show
  end

  # GET /mangas/new
  def new
    @manga = Manga.new
  end

  # GET /mangas/1/edit
  def edit
  end

  # POST /mangas or /mangas.json
  def create
    @manga = Manga.new(manga_params)
    @manga.user = current_user

    respond_to do |format|
      if @manga.save
        format.html { redirect_to @manga.user, notice: "Manga was successfully created." }
        format.json { render :show, status: :created, location: @manga }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mangas/1 or /mangas/1.json
  def update
    respond_to do |format|
      if @manga.update(manga_params)
        format.html { redirect_to @manga.user, notice: "Manga was successfully updated." }
        format.json { render :show, status: :ok, location: @manga }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mangas/1 or /mangas/1.json
  def destroy
    @manga.destroy

    respond_to do |format|
      format.html { redirect_to @manga.user, notice: "Manga was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manga
      @manga = Manga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manga_params
      params.require(:manga).permit(:title, :volumes, :description, :image)
    end
end
