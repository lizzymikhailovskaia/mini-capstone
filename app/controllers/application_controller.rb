class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    redirect_to '/user' unless current_user
  end

  before_action :calculate_cart_count

private ####################

  def calculate_cart_count
    if current_user
      @cart_count = current_user.carted_products.where(carted: "carted").count
    else
      @cart_count = 0
    end
  end
end
