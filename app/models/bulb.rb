# == Schema Information
#
# Table name: bulbs
#
#  id           :integer          not null, primary key
#  lookup_code  :string(255)
#  bulb_type    :string(255)
#  wattage      :float
#  manufacturer :string(255)
#  energy_star  :boolean
#  cost         :float
#  lumens       :float
#  temperature  :float
#  model_number :string(255)
#  link         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bulb < ActiveRecord::Base
  attr_accessible :cost, :energy_star, :link, :lookup_code, :lumens, :manufacturer, :model_number, :temperature, :bulb_type, :wattage

  has_many :replacements, :through => :replacement_bulbs
end
