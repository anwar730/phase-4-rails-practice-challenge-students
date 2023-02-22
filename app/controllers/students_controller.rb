class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json:Student.all,status: :ok
    end
    def show
        student=Student.find(params[:id])
        render json:student
    end
    def create
        student=Student.create!(student_params)
        render json:student,status: :created
    end
    def update
        student=Student.find(params[:id])
        student.update(student_params)
        render json:student
    end
    def destroy
        student=Student.find(params[:id])
        student.destroy!
        head :no_content
    end

    private
    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end
    def student_params
        params.permit(:name,:age,:instructor_id,:major)
    end
end
