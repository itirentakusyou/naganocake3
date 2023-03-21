class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      redirect_back(fallback_location: root_path)
    end

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
    end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item), notice: 'Item is update'
    else
      redirect_back(fallback_location: root_path)
      @item.Item.find(params[:id])
    end
  end

  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :text, :status, :price, :itm_imag_url)#ジャンルid・名前・文・状態・税込価格・写真
  end

end
