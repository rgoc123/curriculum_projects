require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    u = FactoryBot.create(:user)
    allow(subject).to receive(:current_user).and_return(u)
  end

  describe 'GET #new' do
    it 'should respond successfully with a http 200 status code' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end
  
  describe 'GET #index' do 
    it "should render all users" do 
      get :index 
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end 
  end 
  
  describe 'GET #create' do 
    context 'with valid params' do
       it 'redirects to user_url(user_id) page' do
         post :create, params: {user: {username: 'Jolly', password: 'password'}}
         expect(response).to have_http_status(302)
         expect(response).to redirect_to(user_url(User.last))
       end
     end

    context 'with invalid params' do
      it 'renders the new template and populates flash errors' do
        post :create, params: {user: {username: 'No_good', password: ''}}
        expect(response).to render_template(:new)
        expect(flash.now[:errors]).to_not be_nil
      end
    end 
  end 
end
