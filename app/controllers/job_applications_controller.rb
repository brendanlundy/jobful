class JobApplicationsController < ApplicationController
	def index
		@job_applications = JobApplication.order('job_applications.company_name ASC').all
	end

	def show
    @job_application = JobApplication.find(params[:id])
  end
 
	def new
		@user = User.find(params[:user_id])
		@job_application = JobApplication.new
	end
 
  def edit
  	@user = User.find(params[:user_id])
    @job_application = JobApplication.find(params[:id])
  end

	def create
		@user = User.find(params[:user_id])
		@job_application = @user.job_applications.create(job_application_params)

		if @job_application.save
			redirect_to user_job_application_path(@user, @job_application)
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@job_application = JobApplication.find(params[:id])

		if @job_application.update(job_application_params)
			redirect_to user_job_applications_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
    @job_application.destroy
    redirect_to user_job_applications_path
	end

	private
		def job_application_params
			params.require(:job_application).permit(:company_name, :job_title, :job_link, :interest_level, :submit_date, :job_description, :notes, :city, :state)
		end

end