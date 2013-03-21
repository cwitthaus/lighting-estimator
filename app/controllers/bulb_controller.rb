class BulbController < ApplicationController

	def index
		@bulbs = Bulb.paginate(page: params[:page])
	end

	def show
	
	end

end
