class StudentsController < ApplicationController
	before_action :set_student, only: [:show, :edit, :update, :destroy]
	before_action :check_login
	authorize_resource
	def index
	  @active_students = Student.active.alphabetical.paginate(:page => params[:page]).per_page(10)
	  @inactive_students = Student.inactive.alphabetical.to_a
	end

	def show
		@stu_camps=@student.camps
	  
	end


	def new
	  @student = Student.new
	end


	def edit
	end

	def create
	  @student = Student.new(student_params)
	  if @student.save
	    redirect_to @student, notice: "#{@student.proper_name} was added to the system"
	  else
	    render action: 'new'
	  end
	end

	def update
	  if @student.update(student_params)
	    redirect_to @student, notice: "#{@student.proper_name} was revised in the system."
	  else
	    render action: 'edit'
	  end
	end

	def destroy
	  @student.destroy
	  redirect_to students_url, notice: "#{@student.name} student was removed from the system."
	end


  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :date_of_birth, :rating, :active, :family_id, :camp_ids => [])
    end

end


