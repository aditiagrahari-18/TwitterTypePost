require 'test_helper'

class BlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get blocks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get blocks_destroy_url
    assert_response :success
  end

end
