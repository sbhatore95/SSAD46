require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	def test_user_authentication
  		user = User.new
  		assert_not user.save #cannot save empty values in database
  		user.email = "abc@example.com"
  		user.password = "John"
  		assert user.save
  	end
end
