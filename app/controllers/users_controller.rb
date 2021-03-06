class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show]

	def show
		@user = User.find(params[:id])
		@estimates = @user.estimates
	end

	def new
		@user = User.new
	end

	def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  
end
