require 'spec_helper'

describe Admin::AdminController do
  include Devise::TestHelpers

  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  context 'as admin' do
    before {
      sign_in admin
      get :index
    }

    it { should respond_with 200 }
  end

  context 'as admin' do
    before {
      sign_in user
      get :index
    }

    it "lets sets flash error" do
      expect(flash[:error]).to eq("You must be an admin to access this page")
    end

    it { should respond_with 302 }
  end

end
