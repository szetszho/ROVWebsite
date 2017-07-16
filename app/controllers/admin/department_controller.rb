class Admin::DepartmentController < Admin::AdminBaseController

  def fields
    [:short_name, :full_name, require_course_ids: [], member_ids: []]
  end

  protected(:fields)

  def prepare_params(params)
    params[:require_course_ids] ||= []
    params[:member_ids] ||= []
    params
  end

end
