class Admin::AdminBaseController < ActionController::Base

  before_action(:require_login)

  def insert
    model_name = corresponding_model.name.underscore.to_sym
    if params[:commit]
      @record = corresponding_model.new(prepare_params(params.require(model_name).permit(*fields)))
      if @record.save
        return redirect_to('/admin/index')
      else
        @errors = @record.errors
      end
    end
    render("admin/#{model_name}/form")
  end

  def update
    @record    = corresponding_model.find(params.fetch(:id))
    model_name = corresponding_model.name.underscore.to_sym
    if params[:commit]
      if @record.update_record
        return redirect_to('/admin/index')
      else
        @errors = @record.errors
      end
    end
    render("admin/#{model_name}/form")
  end

  def delete
    @record = corresponding_model.find(params.fetch(:id))
    if params[:commit]
      @record.destroy
      return redirect_to('/admin/index')
    end
    render('layouts/delete')
  end

  def corresponding_model
    @corresponding_model ||= Kernel.const_get(self.class.name.chomp('Controller'))
  end

  protected(:corresponding_model)

  def prepare_params(params)
    params
  end

  protected(:prepare_params)

  def fields
    raise(NotImplementedError)
  end

  protected(:fields)

  def require_login
    redirect_to('/admin/login') unless session[:admin]
  end

  private(:require_login)

end
