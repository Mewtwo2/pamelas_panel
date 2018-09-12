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
        @course_students << Student.find(student)
      end
    end

    @course_instructors = []

    if @course.instructor_ids
      @course.instructor_ids.each do |instructor|
        @course_instructors << Instructor.find(instructor)
      end
    end
  end

  def index
    @courses = Course.all
  end

  private

  def course_params
    params.require(:course).permit(:name,:class_hours)
  end

  def is_logged
    redirect_to root_path unless logged_in?
  end
end
