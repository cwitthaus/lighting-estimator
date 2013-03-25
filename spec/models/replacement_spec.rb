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

require 'spec_helper'

describe Replacement do
	before { @replacement = FactoryGirl.create(:replacement)}
  subject { @replacement }

  it { should respond_to(:quantity) }
  it { should respond_to(:current_bulb_name)}
  it { should respond_to(:current_bulb_wattage)}
  it { should respond_to(:replacement_bulb_id)}
  it { should respond_to(:percent_reduction)}
  it { should be_valid }

  describe "when quantity is not present" do
  	before { @replacement.quantity = "" }
  	it { should_not be_valid }
  end

  describe "when quantity is not a number" do
  	before { @replacement.quantity = "Hello" }
  	it { should_not be_valid }
  end

	describe "when quantity is not an integer" do
  	before { @replacement.quantity = 3.6 }
  	it { should_not be_valid }
  end

  describe "when quantity is less than zero" do
  	before { @replacement.quantity = -2 }
  	it { should_not be_valid }
  end

  describe "when current_bulb_wattage is not present" do
  	before { @replacement.current_bulb_wattage = "" }
  	it { should_not be_valid }
  end

  describe "when current_bulb_wattage is not a number" do
  	before { @replacement.current_bulb_wattage = "Hello" }
  	it { should_not be_valid }
  end

	describe "when current_bulb_wattage is less than zero" do
  	before { @replacement.current_bulb_wattage = -2 }
  	it { should_not be_valid }
  end

	describe "when current_bulb_name is not present" do
  	before { @replacement.current_bulb_name = "" }
  	it { should_not be_valid }
  end  

  describe "when estimate_id is not present" do
  	before { @replacement.estimate_id = "" }
  	it { should_not be_valid }
  end

  it  "should have a percent_reduction between 0 and 100" do
  	@replacement.percent_reduction.should > 0
  	@replacement.percent_reduction.should < 100
  end

  

end
