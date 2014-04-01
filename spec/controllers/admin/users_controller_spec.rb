require 'spec_helper'

describe Admin::UsersController do
  include Devise::TestHelpers

  let(:admin) { FactoryGirl.create(:admin) }
  let(:num) { 12 }

  before {
    FactoryGirl.create_list(:user, num)
    sign_in admin
  }

  let(:rand_user) { User.order("RAND()").first }

  context "GET index" do
    it 'returns correct number of users' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  context "GET show" do
    before { get :show, id: rand_user.id }

    it { should respond_with 302 }

    it 'signs in as correct user' do
      subject.current_user.should eq(rand_user)
    end
  end
end
