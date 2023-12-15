class ApplicationController < ActionController::Base
    helper_method :current_student, :current_faculty

    private
  
    def current_student
      @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id]
    end

    def current_faculty
      @current_faculty ||= Faculty.find_by(id: session[:faculty_id]) if session[:faculty_id]
    end
end
