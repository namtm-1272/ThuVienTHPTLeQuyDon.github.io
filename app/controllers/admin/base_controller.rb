class Admin::BaseController < ActionController::Base
  # tao controller admin base để tất cả các controller của admin sẽ kế thừa từ controller này
  # controller này sẽ dùng để viết các function dùng chung cho các controller admin
  # VD: check quyền là admin ms được vào site, ....
  include SessionsHelper
  layout "layouts/application_admin"
  before_action :check_role_user

  private

  def check_role_user
    if !admin?
      flash[:danger] = "you are not admin "
      redirect_to root_path
    end
  end
end
