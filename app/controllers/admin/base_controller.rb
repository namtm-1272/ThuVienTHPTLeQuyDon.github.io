class Admin::BaseController < ActionController::Base
  # tao controller admin base để tất cả các controller của admin sẽ kế thừa từ controller này
  # controller này sẽ dùng để viết các function dùng chung cho các controller admin
  # VD: check quyền là admin ms được vào site, ....
  include SessionsHelper
  include Pagy::Backend
  include Pagy::Frontend
  layout "layouts/application_admin"
  before_action :logged_in_user,:check_role_user

  private

  def check_role_user
    # if current_user.admin?
    if current_user.student?
      flash[:danger] = "you are not admin "
      redirect_to root_path
    end
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
