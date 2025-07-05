require 'rails_helper'

RSpec.describe HabitLogsController, type: :controller do
  let!(:user) { User.create!(email: "user1@test.com", password: "123456")}
  let!(:habit) { user.habits.create!(name: "Bike")}

  before do
    sign_in user    
  end

  describe "Get #create" do
    it "returns a success response" do
      expect {
        post :create, params: { habit_log: { status: "pending", habit_id: habit.id, } }
      }.to change(HabitLog, :count).by(1)
    end
  end
end