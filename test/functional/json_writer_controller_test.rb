require 'test_helper'

class JsonWriterControllerTest < ActionController::TestCase
  test "should get write_json_file" do
    get :write_json_file
    assert_response :success
  end

end
