require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get question_create_url
    assert_response :success
  end

  test "should get edit" do
    get question_edit_url
    assert_response :success
  end

  test "should get delete" do
    get question_delete_url
    assert_response :success
  end

end
