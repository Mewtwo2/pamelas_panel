class CohortsController < ApplicationController

  before_action :is_logged

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to @cohort
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @cohorts = Cohort.all
  end

  def show
    @students = Student.all
    @instructors = Instructor.all
    @cohort = Cohort.find(params[:id])

    @cohort_students = []

    if @cohort.student_ids
      @cohort.student_ids.each do |student|
        stu = Student.where(id: student).first
        if stu.blank?
          flash[:notice] = "Some Students not found or removed"
        else
          @cohort_students << stu
        end
      end
    end

    if @cohort.instructor_id
      @cohort_instructor = Instructor.where(id: @cohort.instructor_id).first
      if @cohort_instructor.blank?
        flash[:notice] = "Instructor not found or removed"
      end
    end

  end

  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    respond_to do |format|
      format.js {redirect_to cohorts_path}
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name,:start_date,:end_date)
  end

  def is_logged
    redirect_to root_path unless logged_in?
  end
end
