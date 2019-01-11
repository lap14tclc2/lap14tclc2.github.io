require 'test_helper'

class CiphersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ciphers_create_url
    assert_response :success
  end

end
