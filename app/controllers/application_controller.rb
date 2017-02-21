class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_store

  def current_store
    @current_store ||= Store.find(session[:store_id]) if session[:store_id]
  end

  def logged_in?
    !!current_store
  end

end
