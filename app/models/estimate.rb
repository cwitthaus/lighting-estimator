# == Schema Information
#
# Table name: estimates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Estimate < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :replacements

  validates :user_id, presence: true

  def find_total_reduction

		reduction_sum = 0
		total_bulbs = 0

		replacements.each do |replacement|
			reduction_sum = reduction_sum + 
					(replacement.percent_reduction*replacement.quantity)
			total_bulbs = total_bulbs + replacement.quantity
		end

		if (total_bulbs > 0)
			return reduction_sum/total_bulbs
		else
			return 0
		end
	end
end
