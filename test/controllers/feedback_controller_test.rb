require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get feedback_new_url
    assert_response :success
  end

  test "should get show" do
    get feedback_show_url
    assert_response :success
  end

end
