module EstimateHelper

	def find_total_reduction_for_estimate(id)
		Estimate.find(id).find_total_reduction
	end

end
