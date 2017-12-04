require 'rails_helper'

RSpec.describe User, type: :model do
  
  let!(:auth_user) { FactoryBot.create(:auth_user) }
  
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  
  # it { should validate_presence_of(:password) }
  it { should allow_value(nil).for(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  it { should have_many(:comments) }
  it { should have_many(:goals) }
  
  describe '::find_by_credentials' do 
    it 'should return user with valid username and password' do 
      expect(User.find_by_credentials('Godzilla', 'password')).to eq(auth_user)
    end 
  end 
  
  describe '#is_password?' do
    it 'should verify a password' do
      expect(auth_user.is_password?('password')).to be true 
    end
  end 
  
  describe '#reset_session_token' do
    it 'should make a new session_token' do
      old_session_token = auth_user.session_token
      expect(auth_user.reset_session_token).to_not eq(old_session_token)
    end
  end
  
  describe '#ensure_session_token' do
    it 'should assign a session token if none exist' do
      expect(auth_user.session_token).to_not be_nil
    end
    
    it 'should not reset if session token exists' do
      old_session_token = auth_user.session_token
      expect(auth_user.ensure_session_token).to eq(old_session_token)
    end
  end
end
