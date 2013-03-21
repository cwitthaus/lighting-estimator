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

