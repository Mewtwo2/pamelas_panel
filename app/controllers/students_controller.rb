class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    p @student
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      p 'student successfully updated'
      redirect_to @student
    else
      render 'edit'
    end
  end

  def show
    @student = Student.find(params[:id])
    @students = Student.all

    if params[:cohort_id]
      @cohort = Cohort.find(params[:cohort_id])
      if @cohort.student_ids == nil
        @cohort.student_ids = []
        @cohort.student_ids << params[:id]
        @cohort.save
      else
        @cohort.student_ids.each do |student|

          if student.to_i == params[:id].to_i
              p "This student is already in the Cohort"
          end

          @cohort.student_ids << params[:id].to_i
          @cohort.student_ids.uniq! # Could not figure out why my other if statement conditional was failing
          @cohort.save

        end # Ends Student ID Iteration Loop
      end # Ends Student ID Array Nil If Statement Check

      # @cohort_students = []
      #
      # @cohort.student_ids.each do |student|
      #   @cohort_students << Student.find(student)
      # end
      #
      # p "Students"
      # p @cohort_students
      redirect_to @cohort
    end # Ends URL Check
  end # Ends Action

  def index
    redirect_to root_path unless logged_in?
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education)
  end
end
