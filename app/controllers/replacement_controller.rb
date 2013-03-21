class ReplacementController < ApplicationController

	def create
		estimate = Estimate.find(params[:estimate_id])

		replacement = estimate.replacements.new(
			:quantity => params[:quantity],
			:current_bulb_name => params[:current_bulb_name],
			:current_bulb_wattage => params[:current_bulb_wattage],
			:replacement_bulb_id => params[:replacement_bulb_id],
		)
		respond_to do |format|
			if replacement.save
      	format.json { render :json => {
      		:new_total_estimate => estimate.find_total_reduction,
      		:replacement => {
						:id => replacement.id,
						:quantity => replacement.quantity,
						:current_bulb_name => replacement.current_bulb_name,
						:current_bulb_wattage => replacement.current_bulb_wattage,
						:replacement_bulb_name => Bulb.find(params[:replacement_bulb_id]).lookup_code,
						:replacement_bulb_wattage => Bulb.find(params[:replacement_bulb_id]).wattage,
						:percent_reduction => replacement.percent_reduction
					} 
      	}}
      else
      	format.json { render :json => {
      		:error => true, 
      		:messages => replacement.errors} 
      	}
      end
    end
	end

	def destroy
		Replacement.find(params[:id]).destroy
		respond_to do |format|
			if !Replacement.exists?(params[:id])
				format.json { render :json => {
					:replacement_id => params[:id], 
					:message => "replacement deleted",
					:new_total_estimate => Estimate.find(params[:estimate_id]).find_total_reduction} 
				}	
			else
				format.json { render :json => {
					:error => true, 
					:message => "replacement unable to be deleted"}
				}
			end
		end
	end

end
