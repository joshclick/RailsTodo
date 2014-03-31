require 'spec_helper'

describe Admin::AdminController do
  include Devise::TestHelpers

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }

  context 'as admin' do
    before {
      sign_in admin
      get :index
    }

    it { should respond_with 200 }
  end

  context 'as user' do
    before {
      sign_in user
      get :index
    }

    it { should respond_with 302 }
  end

end
