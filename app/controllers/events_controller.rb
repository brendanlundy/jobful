class EventsController < ApplicationController
	def index
		@events = Events.all
	end

	def show
    @event = Event.find(params[:id])
  end
 
	def new
		@user = User.find(params[:user_id])
		@job_application = JobApplication.find(params[:job_application_id])
		@event = Event.new()
	end
 
  def edit
  	@user = User.find(params[:user_id])
    @job_application = JobApplication.find(params[:job_application_id])
    @event = Event.find(params[:id])
  end

	def create
		@job_application = JobApplication.find(params[:job_application_id])
		@user = @job_application.user
		@event = @job_application.events.create(event_params)

		if @event.save
			redirect_to edit_user_job_application_path(@user, @job_application)
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@job_application = JobApplication.find(params[:job_application_id])
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to user_job_applications_path
		else
			render 'edit'
		end
	end

	def destroy
		@job_application = JobApplication.find(params[:job_application_id])
    @user = @job_application.user
    @event = @job_application.events.find(params[:id])

    @event.destroy
    redirect_to edit_user_job_application_path(@user, @job_application)
	end


	private
		def event_params
			params.require(:event).permit(:event_type_id, :event_time, :pre_notes, :post_notes)
		end

end