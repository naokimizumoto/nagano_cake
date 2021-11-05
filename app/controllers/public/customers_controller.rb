class Public::CustomersController < ApplicationController
  def show
    @costomer = Costomer.find(params[:id])
  end 
  
  def edit 
    
  end 
  
  def updated
  end 
  
  def withdraw
  end 
  
  def withdraw_update
  end 
end
