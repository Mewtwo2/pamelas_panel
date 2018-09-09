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
      p "Johnny"
      p @cohort.name + " " + @cohort.name.class.to_s
      p @cohort.instructor_id.class
      p @cohort.student_ids.class
      p @cohort
    end
  end

  def index
    redirect_to root_path unless logged_in?
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education)
  end
end
