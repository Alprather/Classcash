class SchoolsController < ApplicationController
  def index
    @schools = School.all
    @school = School.find(params[:id])
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new
    @school.name = params[:school][:name]
    if @school.save
      flash[:notice] = 'School was saved'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error saving the school'
      render :new
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.name = params[:school][:name]

    if @school.save
      flash[:notice] = 'School was updated.'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error saving the school. Please try again.'
      render :edit
    end
  end

  def destroy
    @school = School.find(params[:id])
    if @school.destroy
      flash[:notice] = "\"#{@school.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error deleting the school.'
      render :show
  end
  end
end
