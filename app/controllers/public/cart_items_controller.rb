class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end





  def create
  @cart_item = current_customer.cart_items.build(cart_item_params)
  @cart_items = current_customer.cart_items.all
  @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
      @cart_item.delete
    end
    end
    @cart_item.save
   redirect_to :cart_items
   end
      #if @cart_item
      #new_quantity = @cart_item.quantity + cart_item_params[:quantity]
      #@cart_item.update(amount: new_amount)
      #redirect_to cart_items_path
    #else
     # @cart_item = current_customer.cart_items.new(cart_item_params)
      #@cart_item.item_id = @item.id
      #if @cart_item.save
        #redirect_to cart_items_path
      #else
        #render 'public/items/show'
      #end
    #end



  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params) if @cart_item
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy if @cart_item
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end


end