class ApplicationController < ActionController::Base
  #protect_form_forgery with: :exception
  
before_action :require_user
  
  helper_method :current_user, :logged_in?

#we can use these methods all over the project

  def current_user
      @current_user ||= Student.find(session[:student_id]) if session[:student_id]
      #memorization method  
  end
  
  def logged_in?
      !!current_user #boolean method
      
  end
  
  def require_user
  
    if !logged_in?
      flash[:notice] = "You must be logged  in to perform this action"
      redirect_to login_path
    end
  end
end
