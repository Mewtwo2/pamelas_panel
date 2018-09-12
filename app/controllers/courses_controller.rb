class CoursesController < ApplicationController

  before_action :is_logged

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @students = Student.all
    @instructors = Instructor.all
    @course = Course.find(params[:id])

    @course_students = []

    if @course.student_ids
      @course.student_ids.each do |student|
        stu = Student.where(id: student).first
        if stu.blank?
          flash[:notice] = "Some Students not found or removed"
        else
          @course_students << stu
        end
      end
    end

    @course_instructors = []

    if @course.instructor_ids
      @course.instructor_ids.each do |instructor|
        stu = Instructor.where(id: instructor).first
        if stu.blank?
          flash[:notice] = "Some Students not found or removed"
        else
          @course_instructors << stu
        end
      end
    end

  end

  def index
    @courses = Course.all
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.js {redirect_to courses_path}
    end
  end

  private

  def course_params
    params.require(:course).permit(:name,:class_hours)
  end

  def is_logged
    redirect_to root_path unless logged_in?
  end
end
