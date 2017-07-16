class Admin::SessionController < Admin::ApplicationController

  def details
    @record = Session.find(params.fetch(:id))
  end

end
