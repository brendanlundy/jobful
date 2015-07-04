class UsersController < ApplicationController
	def show
		@user = Users.find(:params[user:id])
	end
end