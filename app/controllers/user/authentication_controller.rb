class User::AuthenticationController < User::UserBaseController

  skip_before_action(:require_login, only: :login)

  def login
    redirect_to('/index') if session[:user_id]
    @student_id = params[:student_id]
    if @student_id && (member = Member.find_by(student_id: @student_id))
      session[:user_id] = member.id
      redirect_to('/index')
    end
  end

  def logout
    reset_session
    render(:login)
  end

end
