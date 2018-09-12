class InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to @instructor
    else
      render 'new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      p 'instructor successfully updated'
      redirect_to @instructor
    else
      render 'edit'
    end
  end

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
    @instructors = Instructor.all

    if params[:cohort_id]
      @cohort = Cohort.find(params[:cohort_id])
      if @cohort.instructor_id == nil
        @cohort.instructor_id = 0
      end # Ends Instructor ID Array Nil If Statement Check

      @cohort.instructor_id = params[:id].to_i
      @cohort.save

      redirect_to @cohort
    end # Ends URL Check
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    # @instructor.destroy
    respond_to do |format|
      format.js {redirect_to instructors_path}
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name,:last_name,:age,:salary,:education)
  end
end
