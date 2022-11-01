require 'rails_helper'

 describe "New Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit new_paper_path(@cmi)
    end
 end