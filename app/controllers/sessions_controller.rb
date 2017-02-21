class SessionsController < ApplicationController
  def new
    #登入頁面使用
  end

  def create
    #尋找使用者
    store = Store.find_by(tax_ID: params[:tax_ID])   
    #驗證使用者，若成功，就建立一個 session，把 user_id 放入 session hash
    if store && store.authenticate(params[:password])
      session[:store_id] = store.id
      redirect_to root_path
#      binding.pry
    else
      redirect_to login_path
    end
  end

  def destroy
    #登出畫面使用，刪除 session hash 裡面的 user_id
    session[:store_id] = nil
    redirect_to root_path
#    binding.pry
  end
end