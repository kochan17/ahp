require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { nickname: "New Nickname", age: 30, gender: "male" } }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "New Nickname", @user.nickname
    assert_equal 30, @user.age
    assert_equal "male", @user.gender
  end

  # 他のテストをここに追加...
end
