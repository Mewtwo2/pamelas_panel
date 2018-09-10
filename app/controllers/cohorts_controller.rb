class CohortsController < ApplicationController
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
    @cohort = Cohort.find(params[:id])

    @cohort_students = []

    if @cohort.student_ids
      @cohort.student_ids.each do |student|
        @cohort_students << Student.find(student)
      end
    end

    p "Students"
    p @cohort_students
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name,:start_date,:end_date)
  end
end
