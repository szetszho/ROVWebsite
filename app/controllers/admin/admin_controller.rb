class Admin::AdminController < Admin::AdminBaseController

  def index
    @data = {departments: Department.all, courses: Course.all, members: Member.all}
  end

end
