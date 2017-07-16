class User::CourseController < User::UserBaseController

  def register
    @data = {}
    if params[:course]
      @data[:course] = Course.find(params.fetch(:course))
      if params[:session]
        @data[:session] = Session.find_by!(id: params.fetch(:session), course: @data[:course])
        if params[:commit]
          @data[:session].participants << @current_user unless @data[:session].participants.include?(@current_user)
          redirect_to(course_register1_path)
        end
      else
        @data[:sessions] = @data[:course].sessions
      end
    else
      @data[:courses] = @current_user.registering_courses_details
    end
  end

  def cancel
    @participation = Participation.find_by!(registered_session_id: params.fetch(:id), participant: @current_user)
    if params[:commit]
      @participation.destroy!
      redirect_to(registered_sessions_path)
    end
  end

end
