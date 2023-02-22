class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json:Instructor.all, status: :ok
    end
    def show
        instructor=Instructor.find(params[:id])
        render json: instructor, status: :ok
    end
    def create
        instructor=Instructor.create!(instructor_params)
        render json: instructor,status: :created
    end
    def destroy
        instructor=Instructor.find(params[:id])
        instructor.destroy
        head :no_content
    end
    def update
        instructor=Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    private
    def render_not_found_response
        render json: { error: "Instructor not found" }, status: :not_found
    end
    def instructor_params
        params.permit(:name)
    end
end
