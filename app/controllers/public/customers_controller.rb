class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer =current_customer

  end

  def updated
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    end
  end

  def withdraw
    @customer = current_customer
  end

  def withdraw_update
    @customer = Customer.find(params[:id])

  end

  private
  def customer_params
    params.require(:customer).permit(:fullname,:first_name_kana,:last_name_kana,:postal_code,:telephone_number,:address,:email)
  end
end
