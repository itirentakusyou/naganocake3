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
      flash[:notice] = "投稿が成功しました"
      redirect_to admin_item_path(@item)
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
      render :new
    end

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find_by(params[:id])
    end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "更新できました"
      redirect_to admin_item_path(@item)
    else
      render :edit
      @item.Item.find(params[:id])
    end
  end

  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :text, :is_sales_status, :price, :itm_imag_url)#ジャンルid・名前・文・状態・税込価格・写真
  end

end
