class SessionsController < ApplicationController
    def new_student
    end
  
    def create_student
      student = Student.find_by(email: params[:email])
  
      if student && student.authenticate(params[:password])
        # Successful login, redirect to the student page
        session[:student_id] = student.id
        redirect_to student_home_path, notice: 'Login successful!'
      else
        # Failed login, redirect back to the login page with an error message
        flash.now[:alert] = 'Invalid email/password combination, please try again.'
        render :new_student
      end
    end
  
    def destroy
      session[:student_id] = nil
      session[:faculty_id] = nil
      redirect_to root_path, notice: 'Logged out!'
    end

    def new_faculty
    end
  
    def create_faculty
      faculty = Faculty.find_by(email: params[:email])
  
      if faculty && faculty.authenticate(params[:password])
        # Successful login, redirect to the faculty page
        session[:faculty_id] = faculty.id
        redirect_to faculty_home_path, notice: 'Login successful!'
      else
        # Failed login, redirect back to the login page with an error message
        flash.now[:alert] = 'Invalid email/password combination'
        render :new_faculty
      end
    end
end
