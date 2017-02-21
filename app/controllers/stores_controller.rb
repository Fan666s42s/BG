class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end


  private 

  def store_params
    params.require(:store).permit(:store_name, :password, :tax_ID, :email)
  end
end