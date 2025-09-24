require "test_helper"

class BanEditingTest < ActionDispatch::IntegrationTest 
  setup do
    sign_in :banner
  end

  test "edit" do
    assert users(:banner).member?
    assert users(:banner).banned?

    get edit_account_url
    # if you are banned, you cannot get there
    assert_response :forbidden
    
  end
end    