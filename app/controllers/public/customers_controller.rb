class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
  	@customer.update(customer_params)
  	redirect_to public_customers_path
  end

  def withdraw
    @customer = current_customer
    @customer.is_deleted= true
    if @customer.save
      reset_session
      redirect_to root_path
    end
  end

 
  
  
  
 private
  def customer_params
   	params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :withdrawal_status, :email)
  end

end



