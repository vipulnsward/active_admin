require 'spec_helper'

describe ActiveAdmin::Views::ActionListPopover do

  let(:the_popover) do
    arbre {
      action_list_popover :id => "my_awesome_action_list_popover" do
        action "My First Great Action", "#"
        action "My Second Great Action", "http://www.google.com"
      end
    }.children.first
  end

  it "should have an id" do
    expect(the_popover.id).to eq "my_awesome_action_list_popover"
  end

  describe "the action list" do
    subject do
      the_popover.find_by_class("popover_contents").first
    end

    its(:tag_name) { should eql("ul") }
    its(:content){ should include("<li><a href=\"#\">My First Great Action</a></li>") }
    its(:content){ should include("<li><a href=\"http://www.google.com\">My Second Great Action</a></li>") }

  end

end
