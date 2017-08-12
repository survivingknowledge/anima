require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'should get new' do
    login_path
    expect(response.status).to eq(200)
  end
end
