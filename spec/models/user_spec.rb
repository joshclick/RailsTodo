require 'spec_helper'
require "cancan/matchers"

describe User do
  describe "abilities" do
    let(:good_user) { FactoryGirl.create(:user) }
    let(:bad_user) { FactoryGirl.create(:user, :secondary) }
    subject(:ability){ Ability.new(good_user) }

    context "for tasks" do
      it "can #index" do
        ability.should be_able_to(:index, Task.new(:user => good_user))
        ability.should_not be_able_to(:index, Task.new(:user => bad_user))
      end

      it "can #create" do
        ability.should be_able_to(:create, Task.new(:user => good_user))
        ability.should_not be_able_to(:create, Task.new(:user => bad_user))
      end

      it "can #destroy" do
        ability.should be_able_to(:destroy, Task.new(:user => good_user))
        ability.should_not be_able_to(:destroy, Task.new(:user => bad_user))
      end

      it "can #update" do
        ability.should be_able_to(:destroy, Task.new(:user => good_user))
        ability.should_not be_able_to(:destroy, Task.new(:user => bad_user))
      end
    end
  end
end
