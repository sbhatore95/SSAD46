require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	def test_template_layout
		assert_template layout: ["layouts/application"]
	end
  # test "the truth" do
  #   assert true
  # end

end
