require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  
  it { should validate_inclusion_of(:complete), in:[true, false] }
  it { should validate_inclusion_of(:private), in:[true, false] }
end
