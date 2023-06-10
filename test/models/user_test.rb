require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(nickname: "Example User", email: "user@example.com",
                     password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "nickname should be present" do
    @user.nickname = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  # 他のテストをここに追加...
end
