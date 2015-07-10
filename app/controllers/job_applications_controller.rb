class JobApplicationsController < ApplicationController
	def index
		@job_applications = JobApplication.order('job_applications.submit_date DESC').all
	end

	def show
    @job_application = JobApplication.find(params[:id])
  end
 
	def new
		@user = User.find(params[:user_id])
		@job_application = JobApplication.new({submit_date: Date.today})
	end
 
  def edit
  	@user = User.find(params[:user_id])
    @job_application = JobApplication.find(params[:id])
    @event = Event.new()
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
    if @job_application.is_archived
    	archive_page = true
    else
    	archive_page = false
    end

    @job_application.destroy
    if archive_page
    	redirect_to user_job_applications_path({archive_page: true})
    else
    	redirect_to user_job_applications_path
    end
	end


	def archive
		@job_application = JobApplication.find(params[:id])
		if @job_application.is_archived
    	archive_page = true
    else
    	archive_page = false
    end
    
  	@job_application.update_attributes({is_archived: !@job_application.is_archived})
  	if archive_page
    	redirect_to user_job_applications_path({archive_page: true})
    else
    	redirect_to user_job_applications_path
    end
	end

	private
		def job_application_params
			params.require(:job_application).permit(:company_name, :job_title, :job_link, :interest_level, :submit_date, :job_description, :notes, :city, :state, :application_status, :is_archived)
		end

end