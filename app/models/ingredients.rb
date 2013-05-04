# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  ingredient :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :float
#

class Ingredients < ActiveRecord::Base
  attr_accessible :ingredient, :price
end
