require 'rails_helper'

RSpec.describe HabitsController, type: :controller do
  let!(:user)  { User.create!(email: "test@example.com", password: "password") }
  let!(:habit) { user.habits.create!(name: "Exercise", frequency_unit: "day", frequency_value: 1, start_date: Date.today) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index

      expect(assigns(:habits)).to eq([habit])
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: habit.id }
      expect(assigns(:habit)).to eq(habit)
    end

    it "renders the show template" do
      get :show, params: { id: habit.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "creates a new habit" do
      expect {
        post :create, params: { habit: { name: "bike ride", frequency_unit: 'day', frequency_value: '1', description: 'get moving', start_date: Date.today, user_id: user.id} }
      }.to change(Habit, :count).by(1)
    end

    it "redirects on success" do
      post :create, params: { habit: { name: "bike ride", frequency_unit: 'day', frequency_value: '1', description: 'get moving', start_date: Date.today, user_id: user.id} }
      expect(flash[:notice]).to eq("Habit created successfully!")
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "User is not signed in" do
    before do
      sign_out user
    end

    describe "GET #index" do
      it "redirects on failure" do
        get :index
        expect(response).to redirect_to(user_session_path)
      end
    end

    describe "GET #show" do
      it "redirects on failure" do
        get :show, params: {id: habit.id}
        expect(response).to redirect_to(user_session_path)
      end
    end
  end
end