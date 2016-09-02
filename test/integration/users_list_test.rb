require 'test_helper'

class UsersListTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
  end

  test "index including pagination" do
    admin_log_in_as(@admin)
    get listusers_path
    assert_template 'users/list'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      
    end
  end
end
