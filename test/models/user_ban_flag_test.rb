require "test_helper"

class UserBanFlagTest < ActiveSupport::TestCase
  test "should read and write ban flag" do
  user = User.new(name: "Test User", email_address: "test@example.com", password: "password")
  assert_not user.ban, "Default ban should be false"
  user.ban = true
  assert user.ban, "Ban should be true after setting"
  user.save!
  user.reload
  assert user.ban, "Ban should persist after save and reload"
  user.ban = false
  user.save!
  user.reload
  assert_not user.ban, "Ban should be false after resetting"
  end
end
