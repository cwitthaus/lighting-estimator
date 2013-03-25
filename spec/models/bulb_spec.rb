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
	before { @bulb = FactoryGirl.build(:bulb)	}
  subject { @bulb }

  it { should respond_to(:lookup_code) }
  it { should respond_to(:bulb_type)}
  it { should respond_to(:wattage) }
  it { should respond_to(:manufacturer) }
  it { should respond_to(:energy_star) }
  it { should respond_to(:cost) }
  it { should respond_to(:lumens) }
  it { should respond_to(:temperature) }
  it { should respond_to(:model_number) }
  it { should respond_to(:link) }
	

  describe "when lookup_code is not present" do
  	before { @bulb.lookup_code = "" }
  	it { should_not be_valid }
  end

  describe "when wattage is not present" do
  	before { @bulb.wattage = "" }
  	it { should_not be_valid }
  end

end
