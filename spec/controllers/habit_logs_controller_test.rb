require "test_helper"

class HabitLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get habit_logs_index_url
    assert_response :success
  end
end
