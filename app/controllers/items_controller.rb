class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      @items = @list.items.reverse
      render "lists/show"
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:description, :status)
  end
end
