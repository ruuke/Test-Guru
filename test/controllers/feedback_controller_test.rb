require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedback_index_url
    assert_response :success
  end

end
