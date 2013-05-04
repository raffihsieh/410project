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

require 'test_helper'

class IngredientsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
