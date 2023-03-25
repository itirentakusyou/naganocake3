class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	#%@customer = current_customer
  	#%@customer.update(customer_params)
  	#%redirect_to  customers_my_page_path 
  	
  	@customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "個人情報を編集しました"
      redirect_to  customers_my_page_path
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
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
   	params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :is_deleted, :email)
  end

end



