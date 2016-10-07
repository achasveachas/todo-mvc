class ListsController < ApplicationController
  def index
    @lists = List.all.reverse
    @list = List.new
  end

  def show
    @list = List.find_by(id: params[:id])
    @items = @list.items.reverse
    @item = Item.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      @lists = List.all.reverse
      render :index
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
