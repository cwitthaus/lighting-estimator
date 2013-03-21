# == Schema Information
#
# Table name: replacements
#
#  id                   :integer          not null, primary key
#  quantity             :integer
#  current_bulb_name    :string(255)
#  current_bulb_wattage :float
#  replacement_bulb_id  :integer
#  percent_reduction    :float
#  estimate_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Replacement < ActiveRecord::Base
  attr_accessible :current_bulb_name, :current_bulb_wattage, :percent_reduction, :quantity, :replacement_bulb_id

  before_validation :find_reduction

  belongs_to :estimate
  has_many :bulbs, :through => :replacement_bulbs

  validates :current_bulb_name, :replacement_bulb_id, 
  					:percent_reduction, :estimate_id,
  	presence: true
  validates :current_bulb_wattage, 
  	:presence => true,
    :numericality =>{ :greater_than => 0 }
  validates :quantity, 
  	:presence => true,
  	:numericality => { :only_integer => true, :greater_than => 0 }


  private
  	def find_reduction
  		self.percent_reduction = 100*(1-((Bulb.find(replacement_bulb_id).wattage)/(current_bulb_wattage.to_f)))
  	end

end
