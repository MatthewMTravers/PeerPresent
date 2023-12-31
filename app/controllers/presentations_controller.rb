class PresentationsController < ApplicationController
  before_action :set_presentation, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:index]

  # GET /presentations or /presentations.json
  def index
    @presentations = Presentation.all
    @students = Student.all
  end
  
  # GET /presentations/1 or /presentations/1.json
  def show
  end
  
  # GET /presentations/new
  def new
    @presentation = Presentation.new
    @current_faculty = current_faculty
    @students = Student.where(course_number: @current_faculty.id)
    @student = current_student
  end

  # GET /presentations/1/edit
  def edit
    @current_faculty = current_faculty
    @students = Student.where(course_number: @current_faculty.id)
  end

  # POST /presentations or /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.faculty_id = current_faculty.id

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to presentation_url(@presentation), notice: "Presentation was successfully created." }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /presentations/1 or /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to presentation_url(@presentation), notice: "Presentation was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /presentations/1 or /presentations/1.json
  def destroy
    @presentation.destroy!

    respond_to do |format|
      format.html { redirect_to presentations_url, notice: "Presentation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_params
      params.require(:presentation).permit(:title, :content, :date, :student_id, :grade, :faculty_id)
    end
    
    def require_login
      unless current_faculty
        redirect_to login_faculty_path, alert: 'You must be logged in to access this page.'
      end
    end
end
