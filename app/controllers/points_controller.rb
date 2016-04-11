class PointsController < ApplicationController
  def up_point
    update_point(1)
    redirect_to :back
   end

  def down_point
    update_point(-1)
    redirect_to :back
end

  private

  def update_point(new_value)
    @student = Student.find(params[:student_id])
    @point = @student.points.where(user_id: current_user.id).first
    @point = current_user.points.create(value: new_value, student: @student)
  end
end
