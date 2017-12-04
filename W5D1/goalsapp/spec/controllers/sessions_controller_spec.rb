require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  let!(:auth_user) { FactoryBot.create(:auth_user) }

  describe "GET #new" do
    it "should render new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)

    end
  end

  describe "GET #create" do
    
    # context 'valid params' do
    #   it 'should create new user and redirect to user page' do
    #     post :create, params: {user: { username: 'valid_user', password: 'Password' } }
    # 
    #     user = User.find_by_credentials('valid_user','Password')
    #     allow(subject).to receive(:current_user).and_return(user)
    # 
    #     expect(response).to have_http_status(302)
    #     expect(response).to redirect_to( user_url(current_user) )
    #   end
    # end
    
    context 'invalid params' do
      it "returns http success" do
        post :create, params: {user: { username: 'invalid_user', password: 'not' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to_not be_nil
      end
    end
    
  end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     delete :destroy
  #     expect(response).to redirect_to(new_session_url)
  #     expect(current_user).to be_nil
  #   end
  # end

end
