class Admin::AuthenticationController < Admin::AdminBaseController

  skip_before_action(:require_login, only: :login)

  def login
    return redirect_to('/admin/index') if session[:admin]
    @password = params[:password]
    if @password && @password == '6y'
      session[:admin] = true
      redirect_to('/admin/index')
    end
  end

  def logout
    reset_session
    render(:login)
  end

end
