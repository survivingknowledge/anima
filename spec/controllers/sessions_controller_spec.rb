require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'sessions#new view is response 200 OK' do
    #get maps to action: , autopicks controller of sessions/file
    get :new
    expect(response.status).to eq(200)
  end
end
