require 'test_helper'

class EmpSessionsHelperTest < ActionView::TestCase

  def setup
    @employee = employees(:employee)
    remember(@employee)
  end

  test "current_employee returns right employee when session is nil" do
    assert_equal @employee, current_employee
    assert is_logged_in?
  end

  test "current_employee returns nil when remember digest is wrong" do
    @employee.update_attribute(:remember_digest, Employee.digest(Employee.new_token))
    assert_nil current_employee
  end
end