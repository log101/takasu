class SearchController < ApplicationController
  def index
    if params[:query]
      @results = Manga.where("title like ?", "#{params[:query]}%")

      respond_to do |format|
        format.html do
          render json: {
            result: @results.map {|item| item.title}
          }.to_json
        end
      end
    end
  end

  def search
  end
end
