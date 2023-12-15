class EvaluationsController < ApplicationController
    
    
    def new 
        @evaluation = Evaluation.new
        @current_student = current_student
        @presentations = Presentation.joins(:student)
                                  .where.not(student_id: @current_student.id)
                                  .where(students: { course_number: @current_student.course_number })
                                  .distinct
        @students = Student.all
        @student = current_student
    end

    def create
        @evaluation = current_student.evaluations.new(evaluation_params)

        if @evaluation.save
            # Does this path need to be defined somehow? How is it defined in students? I think it needs to be defined in routs.rb
            redirect_to evaluations_path, notice: 'Evaluation was successfully created.'
          else
            render :new
          end
    end

    def index
        @current_student = current_student
        @evaluations = Evaluation.includes(:presentation)
                                 .where(presentations: { student_id: @current_student.id })
                                 .order(created_at: :desc)
        render :index                         
      end
      

    def evaluation_params
        params.require(:evaluation).permit(:presentation_id, :score, :feedback, :student_id)
    end

end
