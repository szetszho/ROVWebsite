class Admin::CourseController < Admin::AdminBaseController

  def details
    @record = corresponding_model.find(params.fetch(:id))
  end

  def fields
    [:name, :code, :description, required_department_ids: [], sessions: [[:start_time, :end_time]]]
  end

  protected(:fields)

  def prepare_params(params)
    params[:required_department_ids] ||= []
    sessions = params.require(:sessions)
    sessions.keep_if do |_, x|
      begin
        x.require([:start_time, :end_time])
      rescue ActionController::ParameterMissing
        nil
      end
    end
    params[:sessions] = sessions.to_h.values.map do |x|
      @record && Session.find_by(x.map { |k, v| [k, v.in_time_zone] }.to_h, course: @record) || Session.new(x)
    end
    params
  end

  protected(:prepare_params)

end
