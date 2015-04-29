require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get deathgrips" do
    get :deathgrips
    assert_response :success
  end

end
