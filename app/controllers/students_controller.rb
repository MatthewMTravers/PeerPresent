class StudentsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to login_student_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def destroy
      @current_student.presentations.destroy_all
      @current_student.evaluations.destroy_all
      @current_student.destroy
      redirect_to root_path, notice: 'You have dropped the course and been signed out.'
  end

  def edit
  end

  def update
    if @current_student.update(student_params)
      redirect_to student_home_path, notice: 'Your changes were saved.'
    else
      render :edit
    end
  end  

  def index
    @current_student = current_student
    @presentations = @current_student.presentations
    render :index
  end

  private

  def student_params
    params.require(:student).permit(:fname, :lname, :email, :password, :password_confirmation, :course_number)
  end

  def require_login
    unless current_student
      redirect_to login_student_path, alert: 'You must be logged in to access this page.'
    end
  end
end

