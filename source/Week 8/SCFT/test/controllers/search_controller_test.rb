require 'test_helper'

class SearchControllerTest < ActionController::TestCase
	test "should route to findSurrogateCity" do
  		assert_routing '/search/findSurrogateCity', {controller: "search", action: "findSurrogateCity"}
  	end

  	test "should route to weather" do
  		assert_routing '/search/weather', {controller: "search", action: "weather"}
  	end

  	

  # test "the truth" do
  #   assert true
  # end
end
