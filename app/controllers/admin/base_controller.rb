class Admin::BaseController< ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_require

  def admin_require
    redirect_to root_path, alert: 'You are not an admin!' unless current_user.is_a?(Admin)
  end

end