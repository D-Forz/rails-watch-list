class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def movies
    @movies = if params[:query].present?
                Movie.where('lower(title) LIKE ?', "%#{params[:query].downcase}%")
              else
                Movie.all
              end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
