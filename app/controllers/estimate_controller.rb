class EstimateController < ApplicationController
	before_filter :correct_user, only: [:show]

	def show
		@estimate = Estimate.find(params[:id])	
		@replacements = @estimate.replacements
		@bulbs = Bulb.all	
	end

	def new
		@estimate = current_user.estimates.create
		redirect_to show_estimate_path :id => @estimate
	end

	def add_replacement

	end

	private

		def correct_user
      estimate = Estimate.find(params[:id])
      user = estimate.user
      redirect_to root_path unless current_user?(user)
    end

end
