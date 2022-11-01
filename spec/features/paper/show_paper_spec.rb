require 'rails_helper'

 describe "Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit paper_path(@cmi)
    end
 end