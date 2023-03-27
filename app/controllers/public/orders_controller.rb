class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @order.postage = 800
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      render :confirm
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.post_code = @order.post_code
      @order.address = @order.address
      @order.name = @order.name
    else
      render :new
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items

      @cart_items.each do |cart_item|
        @order_detail = @order.order_details.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        #@order_detail.price = cart_item.item.with_tax
        @order_detail.quantity = cart_item.quantity
        #@order_detail.making_status = "waiting_start"

        @order_detail.save
      end

      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render :new
    end
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_lists = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :name, :address, :post_code, :customer_id, :total_cost, :order_status)
  end

  def address_params
    params.require(:order).permit(:post_code, :address, :name)
  end
end