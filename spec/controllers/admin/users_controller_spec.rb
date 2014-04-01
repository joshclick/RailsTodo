require 'spec_helper'

describe Admin::UsersController do
  include Devise::TestHelpers

  describe "GET index" do
    let(:admin) { FactoryGirl.create(:admin) }
    let(:num) { 12 }

    before {
      FactoryGirl.create_list(:user, num)
      sign_in admin
    }

    it 'returns correct number of users' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end
end
