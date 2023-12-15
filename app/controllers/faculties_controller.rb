class FacultiesController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.new(faculty_params)

    if @faculty.save
      redirect_to login_faculty_path, notice: 'Faculty was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @current_faculty.update(faculty_params)
      redirect_to faculty_home_path, notice: 'Your changes were saved.'
    else
      render :edit
    end
  end  

  def index
    @current_faculty = current_faculty
    @students = Student.where(course_number: @current_faculty.id)
    @presentations = Presentation.all
    @evaluations = Evaluation.all
    render :index
  end

  private

  def faculty_params
    params.require(:faculty).permit(:fname, :lname, :email, :password, :password_confirmation)
  end

  def require_login
    unless current_faculty
      redirect_to login_faculty_path, alert: 'You must be logged in to access this page.'
    end
  end
end