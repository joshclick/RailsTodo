require 'spec_helper'

describe Task do
  it "is invalid without todo_text" do
    FactoryGirl.build(:task, todo_text: nil).should_not be_valid
  end

  it "is invalid if todo_text.length > 512" do
    FactoryGirl.build(:task_todo_text_long).should_not be_valid
  end
end
