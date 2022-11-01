require 'rails_helper'

 describe "Index Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit papers_path(@cmi)
    end
 end