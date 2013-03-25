# == Schema Information
#
# Table name: estimates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'spec_helper'

describe Estimate do

	before { @estimate = FactoryGirl.create(:estimate_with_replacements) }
  subject { @estimate }

  it { should respond_to(:find_total_reduction) }

	describe "when no associated user" do
		before { @estimate.user_id = "" }
  	it { should_not be_valid }
	end

	it "should have 4 replacements" do
		@estimate.replacements.size.should == 4
	end

	describe "find_total_reduction" do

		it "should be between 0 and 100" do
			@estimate.find_total_reduction.should > 0
			@estimate.find_total_reduction.should < 100
		end

		it "should be zero when estimate has no replacements" do
			estimate_no_replacements = FactoryGirl.create(:estimate)
			estimate_no_replacements.find_total_reduction.should == 0
		end
		
	end
end
