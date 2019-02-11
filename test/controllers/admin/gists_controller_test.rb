require 'test_helper'

class Admin::GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gists_index_url
    assert_response :success
  end

end
