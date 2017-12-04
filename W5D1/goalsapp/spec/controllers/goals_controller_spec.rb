require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  
  describe "GET #new" do
    it "should render new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    
    before(:each) do
      u = FactoryBot.create(:user)
      allow(subject).to receive(:current_user).and_return(u)
    end
    
    context 'with valid goal params' do
      it "should redirect to user's goal page" do 
        post :create, params: { goal: { title: 'New Goal', body: 'Just create a goal', private: false, complete: true }}
        expect(response).to redirect_to(goal_url(Goal.last))
      end
    end 
  
    context 'with invalid params' do
      it 'should render new template and flash errors' do
        post :create, params: { goal: { title: 'New Goal', body: nil, private: false, complete: true } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to_not be_nil
      end
    end
  end
  
  describe "GET #edit" do
    it "should render edit template" do
      u = FactoryBot.create(:user)
      allow(subject).to receive(:current_user).and_return(u)
      
      g = Goal.new( title: 'To edit', body: 'BLAH', private: false, complete: false )
      g.user_id = User.last.id
      g.save 
      
      get :edit, params: { id: Goal.last.id }
      
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    
    before(:each) do 
      u = FactoryBot.create(:user)
      allow(subject).to receive(:current_user).and_return(u)
      
      @g = Goal.new( title: 'To edit', body: 'BLAH', private: false, complete: false )
      @g.user_id = User.last.id
      @g.save
    end
    
    context 'with valid params' do
      it "should update goal for author" do
        patch :update, params: {id: @g.id, goal: { title: 'New Goal', body: 'NEW BODY', private: false, complete: true } }
        debugger
        expect(response).to have_http_status(:success)
        expect(flash[:success]).to be_present 
      end 
    end
    
    context 'with invalid params' do 
      it 'should flash errors and render edit' do
        patch :update, params: {id: @g.id, goal: { title: 'New Goal', body: nil , private: false, complete: true } }
        expect(response).to render_template(:edit)
        expect(flash[:errors]).to_not be_nil 
      end
    end 
  end

  describe "GET #show" do
    it "should render goal show template" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    # u = FactoryBot.build(:user)
    # allow(subject).to receive(:current_user).and_return(u)

    it "should render current user's goals" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #destroy" do
    it "should flash success on delete and redirect to goal index" do
      delete :destroy
      expect(response).to redirect_to(goals_url)
      expect(flash[:success]).to_not be_nil
    end
  end

end
