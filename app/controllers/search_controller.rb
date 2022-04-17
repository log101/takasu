class SearchController < ApplicationController
  def index
    if params[:query]
      # @results = Manga.where("title like ?", "#{params[:query]}%")
      @results = Manga.search(params[:query])

      respond_to do |format|
        format.html do
          render json: {
            results:
              @results
                .filter { |item| item.user.id != current_user.id }
                .map do |item|
                {
                  id: item.id,
                  title: item.title,
                  link: user_path(item.user_id)
                }
              end
          }.to_json
        end
      end
    end
  end

  def search
  end
end
