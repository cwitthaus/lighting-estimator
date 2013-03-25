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

class ReplacementBulbs < ActiveRecord::Base
  attr_accessible :bulb_id, :replacement_id

  belongs_to :replacement
  belongs_to :bulb

  validates :replacement_id, :bulb_id, presence: true
end
