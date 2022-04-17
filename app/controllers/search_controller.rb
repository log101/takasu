class SearchController < ApplicationController
  def index
    if params[:query]
      # @results = Manga.where("title like ?", "#{params[:query]}%")
      @results = Manga.search(params[:query])

      respond_to do |format|
        format.html do
          render json: {
            results: @results.map {|item| item.title}
          }.to_json
        end
      end
    end
  end

  def search
  end
end
