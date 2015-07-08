class Event < ActiveRecord::Base
	belongs_to :job_application
	belongs_to :event_type

	validates :job_application, presence: true
	validates :event_type, presence: true
end
