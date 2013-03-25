# == Schema Information
#
# Table name: replacement_bulbs
#
#  id             :integer          not null, primary key
#  bulb_id        :integer
#  replacement_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe ReplacementBulbs do
	before { @replacement_bulb = FactoryGirl.create(:replacement_bulbs)}
  subject { @replacement_bulb }

  it { should respond_to(:bulb_id) }
  it { should respond_to(:replacement_id)}
  it { should be_valid }

  describe "when bulb_id is not present" do
  	before { @replacement_bulb.bulb_id = "" }
  	it { should_not be_valid }
  end
 
  describe "when replacement_id is not present" do
  	before { @replacement_bulb.replacement_id = "" }
  	it { should_not be_valid }
  end

end