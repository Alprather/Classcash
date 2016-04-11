class StudentsController < ApplicationController
  # before_filter :get_students, only: [:index]

  def index
    @section = Section.find(params[:section_id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @section = Section.find(params[:section_id])

  end

  def create
    @student = Student.new
    @student.name = params[:student][:name]
    @section = Section.find(params[:section_id])
    @student.section = @section
    if @student.save
      flash[:notice] = 'Student was saved'
      redirect_to [@section]
    else
      flash.now[:alert] = 'There was an error saving the student'
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.name = params[:student][:name]

    if @student.save
      flash[:notice] = 'Student was updated.'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error saving the student. Please try again.'
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
    flash[:notice] = "\"#{@student.name}\" was deleted successfully."
    redirect_to user_path
  else
    flash.now[:alert] = "There was an error deleting the student."
    render :show
  end
  end
end
