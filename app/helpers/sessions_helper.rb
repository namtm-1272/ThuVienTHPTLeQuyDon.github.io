module SessionsHelper
  def log_in object
    session[:object_id] = object.id
  end

  def current_object
    @current_object ||= Student.find_by id: session[:object_id]
    if @current_object
      @is_gv = false
    else
      @is_gv = true
      @current_object ||= Admin.find_by id: session[:object_id]
    end
  end

  def logged_in?
    !current_object.nil?
  end

  def log_out
    session.delete :object_id
    @current_object = nil
  end

  def is_gv?
    @is_gv
  end
end
