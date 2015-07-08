class JobApplication < ActiveRecord::Base
	STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)

	belongs_to :user
	has_many :events, dependent: :destroy
	
	validates :company_name, presence: true
	validates :job_title, presence: true
	validates :interest_level, numericality: { only_integer: true, greater_than: 0, less_than: 11 },
															allow_nil: true
	validates :state, inclusion: { in: STATES, allow_blank: true, allow_nil: true, message:" must be a real US state"}

	before_validation :check_case

  def check_case
    self.state.upcase!
  end
end