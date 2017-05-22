class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_classroom(classroom=1)
     session[:classroom_id] = classroom
  end

  def get_classroom
    Classroom.find(session[:classroom_id])
  end
end
