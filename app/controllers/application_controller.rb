# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_valid_user!

  add_flash_types :danger, :error

  def current_user
    @user ||= User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def require_valid_user!
    redirect_to login_path, error: 'You must be logged in to access this page!' if current_user.nil?
  end
end
