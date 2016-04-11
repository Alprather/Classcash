class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new
    @section.name = params[:section][:name]
    @section.grade = params[:section][:grade]
    if @section.save
      flash[:notice] = 'Section was saved'
      redirect_to @section
    else
      flash.now[:alert] = 'There was an error saving the section'
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.name = params[:section][:name]
    @section.name = params[:section][:grade]

    if @section.save
      flash[:notice] = 'Section was updated.'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was an error saving the section. Please try again.'
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
    flash[:notice] = "\"#{@section.name}\" was deleted successfully."
    redirect_to root_path
  else
    flash.now[:alert] = "There was an error deleting the section."
    render :show
  end
  end
end
