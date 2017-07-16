class Admin::MemberController < Admin::AdminBaseController

  def fields
    [:name, :student_id, :department_id, :phone]
  end

  protected(:fields)

end
