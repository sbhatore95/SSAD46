require 'test_helper'

class LocationTest < ActiveSupport::TestCase
	test "cities existsing in the database" do
		loc = Location.new
		loc.City = "Allahabad"
		loc.save

  		city = Location.find_by(City: "Allahabad")
  		assert_not_nil city #Allahabad is in database so this can't be nil
  		city = Location.find_by(City: "Indore")
  		assert_nil city #Indore is not in database, should be null
  	end
  # test "the truth" do
  #   assert true
  # end
end
