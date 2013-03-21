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

require 'spec_helper'

describe Bulb do
	

end
