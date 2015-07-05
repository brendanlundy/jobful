class JobApplication < ActiveRecord::Base
	belongs_to :user
	validates :company_name, presence: true
	validates :job_title, presence: true
	validates :interest_level, numericality: { only_integer: true, greater_than: 0, less_than: 11 },
															allow_nil: true
end