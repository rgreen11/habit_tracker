require "test_helper"

RSpec.describe HabitLogsController, type: :controller do
  let!(:user) { User.create!(email: "user@test.com", password: "123456")}
  let!(:habit) { user.habits.create!(name: "Bike")}

  before do
    sign_in user    
  end

  describe "Get #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end