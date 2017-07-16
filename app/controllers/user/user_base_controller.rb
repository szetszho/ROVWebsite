class User::UserBaseController < ActionController::Base

  before_action(:require_login)

  def require_login
    redirect_to('/login') unless session[:user_id] && (@current_user = Member.find_by(id: session[:user_id]))
  end

  private(:require_login)

end
