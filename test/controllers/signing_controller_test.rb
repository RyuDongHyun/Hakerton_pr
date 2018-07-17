require 'test_helper'

class SigningControllerTest < ActionController::TestCase
  test "should get sign_up" do
    get :sign_up
    assert_response :success
  end

end
